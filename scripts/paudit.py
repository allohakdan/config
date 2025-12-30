#!/usr/bin/env python3
# Audits account files
import argparse
import glob
import os
import re

## TODO
## FileParser - Parse out tags and create dictionary object representation of file
##
## FindDuplicate - create a database of strings that appear in multiple files
## Search - search encrypted files for a string

# Find Script Directory
DIR = os.path.dirname(os.path.abspath(__file__))

from dgpg import DGPG

KEYWORDS = ["SITE", 
            "DESC", 
            "USER", 
            "PASS", 
            "MAIL", 
            "LINK", 
            "PHONE", 
            "OLD", 
            "PIN", 
            "NOTE"]

# Keyword list with appended ':'
# needs to be a tuple to be compatible with str.startswith()
KEYWORD_TOKENS = tuple([w + ":" for w in KEYWORDS])

def parse_file(file_contents):
    """
    contents(str) -  file contents as a single string
    returns(dict) - "TAGS":
                        "SITE": str
                        "MAIL": str
                        "USER": str
                        "PASS": str
                        "OLD": [str, str, str...]
    """
    output = list()
    #output = [{"tags": {"SITE": str, "DESC": str}
    #           "text": [line1, line2, line3]},
    #          {"tags":
    #           "text":

    # Split file contents into entries by dividers ---- (at least 4 or longer).
    # If no dividers are found, returns a list with single item
    entries = re.split("\-\-\-\-\-*", file_contents)

    for entry_text in entries:
        entry_data = {"TAGS": dict(), "TEXT": list()}

        # Split the entry into individual lines
        lines = [line.strip() for line in entry_text.split("\n")]

        # Each line is either a tag (starts with a keyword) or text
        for line in lines:

            # Check if this is a TAG (starts with a keyword)
            if line.upper().startswith(KEYWORD_TOKENS):

                # Split the line into the KEY: VALUE pair
                # If there are additional ':' in the line, ignore them
                key, value = line.split(":", 1)  

                # Add the KEY:VALUE to the dictionary
                if key not in entry_data["TAGS"]:
                    entry_data["TAGS"][key] = value.strip()

                else:
                    # If more than one line is found with the same tag, turn it into a list
                    if not isinstance(entry_data["TAGS"][key], list):
                        first_value = entry_data["TAGS"][key]
                        entry_data["TAGS"][key] = [first_value]

                    # add the VALUE to the list for the KEY
                    entry_data["TAGS"][key].append(value.strip())

            elif line:
                # If not TAG is found and it is not a blank line, add it as text
                entry_data["TEXT"].append(line)
        output.append(entry_data)
    return output




class Cmd(object):
    name = None
    description = None
    def __init__(self):
        assert(self.name is not None)
        assert(self.description is not None)

    def add_to_parser(self, subparser):
        """ Receives a subparser, should return a subparser """
        self.setup_parser(subparser.add_parser(self.name, help=self.description))
        return subparser

    def setup_parser(self, parser):
        pass

    def cmd(self, files, args):
        raise NotImplementedException()

class ListFilesCmd(Cmd):
    name = "list"
    description = "list files"

    def cmd(self, files, args):
        for f in files:
            print(f)

class DetectNotGPG(Cmd):
    name = "detect_not_gpg"
    description = "Detects files that are not GPG ascii encrypted"

    def cmd(self, files, args):
        bad_files = dict()
        for path in files:
            # Skip certain files
            if os.path.basename(path) in ["README.md"]:
                continue
            # Skip if path is a directory
            if os.path.isdir(path):
                continue
            # Follow symlinks
            if os.path.islink(path):
                path = os.path.realpath(path)
            # Check for empty files
            if not os.path.getsize(path) > 0:
                bad_files[path] = ["<<< EMPTY FILE >>>"]
                continue
            # Read the contents
            try:
                with open(path, "r") as f:
                    contents = f.readlines()
            except UnicodeDecodeError:
                bad_files[path] = ["<<< BYTES FOUND >>>"]
                continue

            if re.match("^\-+BEGIN PGP MESSAGE\-+.*", str(contents[0])) is None:
                bad_files[path] = contents


        if bad_files:
            print("Found non GPG Files:")
            for name, contents in bad_files.items():
                print("-", name)
                for line in contents:
                    print(str(line))
                print()

class FindMissingPassLabelCmd(Cmd):
    name = "find_missing_passwd_labels"
    description = "Find files missing PASSWD label"

    def cmd(self, files, args):
        dgpg = DGPG()
        dgpg.read_passwd()

        file_tags = dict() #name(str): [str, str] or None
        for path in files:
            dgpg.read_gpg_file(path)
            print("........................")
            contents = dgpg.get_contents()
            file_tags[path] = None
            tags = ["EMAIL:", "PASS:", "PASSWD:", "USER:"]
            found_tags = [tag for tag in tags if tag in contents]
            if found_tags:
                file_tags[path] = found_tags
            print(path, found_tags)

        print("\n\n\n")
        print("FILES Containing Tags:")
        for filename, keys in file_tags.items():
            if keys is not None:
                print(filename, keys)
#         for name in [key for key,value in file_status.items() if value]:
#             print(name)

class ParseFileCmd(Cmd):
    name = "parse"
    description = "Parse a file"

    def cmd(self, files, args):
        dgpg = DGPG()
        dgpg.read_passwd()

        for path in files:
            if path.endswith(args.file):
                print("Found matching file:", path)
                dgpg.read_gpg_file(path, hide_errors=True)
                contents = dgpg.get_contents()
                data = parse_file(contents)
                # Pretty print the data by abusing json
                import json
                print(json.dumps(data, indent=2))
                print("\n")


    def setup_parser(self, parser):
        parser.add_argument("file", type=str, help="file to parse")

class SearchForStringCmd(Cmd):
    name = "search_for_string"
    description = "Search for a string in files ignoring tags - string is entered at runtime"

    def cmd(self, files, args):
        if args.ignore_case:
            print("Ignoring Case")
        pattern = input("Search String: ")

        dgpg = DGPG()
        dgpg.read_passwd()


        for path in files:
            dgpg.read_gpg_file(path, hide_errors=True)
            contents = dgpg.get_contents()
            if args.ignore_case:
                if pattern.lower() in [c.lower() for c in contents.split()]:
                    print(path)
            else:
                if pattern in contents:
                    print(path)

    def setup_parser(self, parser):
        parser.add_argument("-i", "--ignore-case", action="store_true", help="ignore case")



class PasswordSearchCmd(Cmd):
    name = "passwd_search"
    description = "Search PASS and TEXT for pattern"

    def cmd(self, files, args):
        pattern = input("Search String: ")

        dgpg = DGPG()
        dgpg.read_passwd()

        for path in files:
            dgpg.read_gpg_file(path, hide_errors=True)
            contents = dgpg.get_contents()
            data = parse_file(contents)

            for entry in data:
                # Check if tag PASS is set and matches pattern
                if "PASS" in entry["TAGS"]:
                    if entry["TAGS"]["PASS"] == pattern:
                        print("FOUND PASS", path)
                # if PASS is not defined, check to see if it exists in text
                else:
                    for line in entry["TEXT"]:
                        if pattern in line:
                            print("FOUND TEXT", path)



def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("directory")
    parser.add_argument("--r", "--recursive", dest="recursive", action="store_true", help="recurse")
    subparser = parser.add_subparsers(dest="cmd", metavar="Command")

    # Load Commands
    cmd_classes = Cmd.__subclasses__()
    commands = {cls.name: cls() for cls in cmd_classes}
    for cmd in commands.values():
        cmd.add_to_parser(subparser)



    args = parser.parse_args()

    # Collect list of encrypted files
    path = os.path.abspath(os.path.expanduser(args.directory))
    if args.recursive:
        files = glob.glob(os.path.join(path, "**/**"), recursive=True)
#         files = glob.glob(os.path.join(path, "**/**.asc"), recursive=True)
    else:
#         files = glob.glob(os.path.join(path, "**.asc"))
        files = glob.glob(os.path.join(path, "**"))

    # Run the specified command
    name = args.cmd
    if name not in commands.keys():
        parser.print_help()
    else:
        commands[args.cmd].cmd(files, args)


if __name__ == "__main__":
    main()

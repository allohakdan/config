#!/usr/bin/env python3
# Audits account files
import argparse
import glob
import os
import re


# Find Script Directory
DIR = os.path.dirname(os.path.abspath(__file__))

from dgpg import DGPG
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

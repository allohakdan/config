#!/usr/bin/env python3
# Audits account files
import argparse
import glob
import os


# Find Script Directory
DIR = os.path.dirname(os.path.abspath(__file__))

from dgpg import DGPG

class Cmd(object):
    name = None
    description = None
    def __init__(self):
        self._cmd_parser = None

    def _add_to_parser(self, subparser):
        self._cmd_parser = subparser.add_parser(self.name, help=self.description)
        self.setup_parser(self._cmd_parser)
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

class FindMissingPassLabelCmd(Cmd):
    name = "find_missing_passwd_labels"
    description = "Find files missing PASSWD label"

    def cmd(self, files, args):
        dgpg = DGPG()
        dgpg.read_passwd()

        file_status = dict() #name(str): bool
        for path in files:
            dgpg.read_gpg_file(path)
            print("........................")
            contents = dgpg.get_contents()
            flag = True if "EMAIL:" in contents else False
            print(path)
            file_status[path] = True if "PASSWD:" in contents else False

        print("\n\n\n")
        print("FILES PASSING:")
        for name in [key for key,value in file_status.items() if value]:
            print(name)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("directory")
    parser.add_argument("--r", "--recursive", dest="recursive", action="store_true", help="recurse")
    subparser = parser.add_subparsers(dest="cmd", metavar="Command")

    # build list of commands
    cmds = dict()
    for cmd_class in Cmd.__subclasses__():
        cmds[cmd_class.name] = cmd_class()
        cmds[cmd_class.name]._add_to_parser(subparser)

    args = parser.parse_args()

    # Collect list of encrypted files
    path = os.path.abspath(os.path.expanduser(args.directory))
    if args.recursive:
        files = glob.glob(os.path.join(path, "**/**.asc"), recursive=True)
    else:
        files = glob.glob(os.path.join(path, "**.asc"))

    # Run the specified command
    name = args.cmd
    if name not in cmds.keys():
        parser.print_help()
    else:
        cmds[name].cmd(files, args)


if __name__ == "__main__":
    main()

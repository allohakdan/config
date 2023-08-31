#!/usr/bin/env python3
import argparse
from datetime import datetime, timedelta

def datestr(date):
    """ Returns a datetime object as MM/DD/YY """
    assert(isinstance(date, datetime))
    return date.strftime("%m/%d/%y")

def main():
    today = datestr(datetime.now())

    parser = argparse.ArgumentParser(prog="DateAdder",
                                     description="Calculate the future date by number of days away",
                                     epilog="Example: ./dateadder.py --start %s --days 28" % today)
    parser.add_argument("--start", type=str, default=today, help="starting date (default: %s)" % today)
    parser.add_argument("--days", type=int, help="number of days forward (required)")
    args = parser.parse_args()

    if not args.days:
        parser.print_help()
        return

    start_date = datetime.strptime(args.start, "%m/%d/%y")
    end_date = start_date + timedelta(days=args.days)
    print("Start Date:", datestr(start_date))
    print("+ Num Days:", args.days)
    print("Ending Day:", datestr(end_date))

if __name__ == "__main__":
    main()

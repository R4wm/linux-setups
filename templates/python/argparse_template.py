#!/usr/bin/env python3

import argparse


def something():
    print("something")
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='someApplicatinn',
                                     description='some descriptiont',
                                     epilog='''
                                     some cool epilog
                                     ''')
    parser.add_argument("--foo", help='foor of the %(prog)s program')

    args = parser.parse_args()

    print(f"this is args: {args}")
    
    

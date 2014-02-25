#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
14.3.2 Visitor ÉpÉ^Å[Éì p.387
"""


import os

def visit(directory, visitor):
    print directory
    for root, dirs, files in os.walk(directory):
        for file in files:
            print file
            ext = os.path.splitext(file)[-1][1:]
            meth = getattr(visitor, ext, None)
            if meth is not None:
                meth(os.path.join(root, file))

class FileReader(object):
    def pdf(self, file):
        print 'processing %s' % file
        
    def jpg(self, file):
        print 'processing %s' % file

def main():
    visit('/home/music/image/', FileReader())

if __name__ == "__main__":
    main()


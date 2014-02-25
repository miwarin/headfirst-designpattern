#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
14.3.2 Visitor ÉpÉ^Å[Éì p.386
"""


class MyClass:
    value = 1
    def __str__(self):
        return str(self.value)


class Printer(object):
    def visit_int(self, ob):
        print 'int %s' % ob

    def visit_str(self, ob):
        print 'str: %s' % str(ob)
        
    def visit_list(self, ob):
        print 'list content: '
        print str(ob)

    def visit_dict(self, ob):
        print 'dict keys: %s' % ','.join(ob.keys())

    def visit_MyClass(self, ob):
        print 'MyClass %s' % ob


def visit(visited, visitor):
    cls = visited.__class__.__name__
    meth = 'visit_%s' % cls
    method = getattr(visitor, meth, None)
    if method is not None:
        method(visited)

def main():
    visit([1, 2, 5], Printer())
    visit( {'one' : 1, 'two' : 2, 'three' : 3}, Printer())
    visit('hoge', Printer())
    visit(99, Printer())
    visit(MyClass(), Printer())


if __name__ == "__main__":
    main()


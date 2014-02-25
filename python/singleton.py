#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
14.1.1 Singleton ÉpÉ^Å[Éì p.375
"""

class Singleton(object):
    _state = {}
    def __new__(cls, *args, **kw):
        ob = super(Singleton, cls).__new__(cls, *args, **kw)
        ob.__dict__ = cls._state
        return ob


class MyClass(Singleton):
    a = 1

class MyOtherClass(MyClass):
    b = 3


def main():
    one = MyClass()
    two = MyClass()
    three = MyOtherClass()

    print one.a
    two.a = 3
    print one.a
    print three.a
    print three.b



if __name__ == "__main__":
    main()


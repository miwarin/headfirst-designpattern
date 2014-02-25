#!/usr/bin/python
# -*- coding:utf8 -*-

# ruby コードを書き換える
# http://www.area51.gr.jp/~rin/diary/?date=20090507#p05
#

class Singleton:
    __instance = None

    def get_instance(self):
        if Singleton.__instance != None:
            return Singleton.__instance
        else:
            Singleton.__instance = 0
            return Singleton.__instance


print Singleton().get_instance()


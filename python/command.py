#!/usr/bin/python
# -*- coding:utf8 -*-

# ruby コードを書き換える
# http://www.area51.gr.jp/~rin/diary/?date=20090507#p06
#

class Command:
    def execute(self):
        return

class Command1(Command):
    def execute(self):
        print "皇帝陛下ですね？"

class Command2(Command):
    def execute(self):
        print "そうだ。"

class Command3(Command):
    def execute(self):
        print "妹ロックブーケのカタキです。殺らせていただきます。"


class Noel:
    def __init__(self):
        self.slot = []
    
    def add(self, command):
        self.slot.append(command)
    
    def run(self):
        for c in self.slot:
            c.execute()


def main():
    noel = Noel()
    noel.add(Command1())
    noel.add(Command2())
    noel.add(Command3())
    noel.run()

main()


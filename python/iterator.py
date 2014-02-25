#!/usr/bin/python
# -*- coding:utf8 -*-

# ruby コードを書き換える
# http://www.area51.gr.jp/~rin/diary/?date=20090512#p07
#

class MyEach:
    def __init__(self, data):
        self.data = data
        self.index = 0
    
    def __iter__(self):
        return self
    
    def next(self):
        if self.index == 0:
            raise StopIteration
        
        d = self.data[self.index]
        self.index = self.index + 1
        return 

def use_iterator(data):
    print "use_iterator"
    for d in MyEach(data):
        print d

def my_each(data):
    for d in data:
        yield d

def use_generator(data):
    print "use_generator"
    for d in my_each(data):
        print d


def main():
    data = ["K&Bのパンケーキ朝食", "通常のパンケーキ朝食", "ワッフル"]
    use_iterator(data)
    use_generator(data)

main()


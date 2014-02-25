#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 9章 Iterator パターン - ヨタの日々(2009-05-12)
# http://www.area51.gr.jp/~rin/diary/?date=20090512#p07

# イテレータ版

class Menu:
  def __init__(self, item):
    self.item = item
    self.count = len(item)
  
  def __iter__(self):
    return self
    
  def next(self):
    if self.count == 0:
      raise StopIteration
    i = len(self.item) - self.count
    self.count -= 1
    return self.item[i]


def main():
  menuItems = [ "K&Bのパンケーキ朝食", "通常のパンケーキ朝食", "ワッフル"]
  menu = Menu(menuItems)
  for n in menu:
    print n

main()

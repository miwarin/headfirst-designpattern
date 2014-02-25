#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 9章 Iterator パターン - ヨタの日々(2009-05-12)
# http://www.area51.gr.jp/~rin/diary/?date=20090512#p07

# ジェネレータ版

def menu(item):
  for index in range(len(item)):
    yield item[index]


def main():
  menuItems = [ "K&Bのパンケーキ朝食", "通常のパンケーキ朝食", "ワッフル"]
  for n in menu(menuItems):
    print n

main()

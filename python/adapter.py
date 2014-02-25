#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 7章 Adapter パターン - ヨタの日々(2009-05-08)
# http://www.area51.gr.jp/~rin/diary/?date=20090508#p04


class Duck:
  def quack(self): pass

  def fly(self): pass

class MallardDuck(Duck):

  def quack(self):
    print "ガーガー"

  def fly(self):
    print "飛んでいます"

class Turkey:
  def gobble(self): pass

  def fly(self): pass

class WildTurkey(Turkey):

  def gobble(self):
    print "ゴロゴロ"

  def fly(self):
    print "短い距離を飛んでいます"

class TurkeyAdapter(Duck):

  def __init__(self, turkey):
    self.turkey = turkey

  def quack(self):
    self.turkey.gobble()

  def fly(self):
    for i in range(5):
      self.turkey.fly()

def main():
  duck = MallardDuck()
  turkey = WildTurkey()
  turkeyAdapter = TurkeyAdapter(turkey)

  print "Turky の出力..."
  turkey.gobble()
  turkey.fly()

  print "\nDuck の出力..."
  testDuck(duck)

  print "\nTurkeyAdapter の出力..."
  testDuck(turkeyAdapter)

def testDuck(duck):
  duck.quack()
  duck.fly()

main()

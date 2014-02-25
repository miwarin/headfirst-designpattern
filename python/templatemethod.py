#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 8章 Template Method パターン - ヨタの日々(2009-05-08)
# http://www.area51.gr.jp/~rin/diary/?date=20090508#p06


class CaffeineBeverage:
  def prepareRecipe(self):
    self.boilWater()
    self.brew()
    self.pourInCup()
    self.addCondiments()

  def brew(self): pass

  def addCondiments(self): pass

  def boilWater(self):
    print "お湯を沸かします"

  def pourInCup(self):
    print "カップに注ぎます"

class Tea(CaffeineBeverage):
  def brew(self):
    print "紅茶を浸します"

  def addCondiments(self):
    print "レモンを追加します"

class Coffee(CaffeineBeverage):
  def brew(self):
    print "フィルタでコーヒーをドリップします"

  def addCondiments(self):
    print "砂糖とミルクを追加します"


def main():
  tea = Tea()
  coffee = Coffee()

  print "\n紅茶を作っています..."
  tea.prepareRecipe()

  print "\nコーヒーを作っています..."
  coffee.prepareRecipe()

main()

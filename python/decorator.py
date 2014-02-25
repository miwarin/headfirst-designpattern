#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 3章 Decorator パターン - ヨタの日々(2009-05-05)
# http://www.area51.gr.jp/~rin/diary/?date=20090505#p06


class Beverage:
  
  def __init__(self):
    self.description = "不明な飲み物"

  def getDescription(self):
    return self.description;

  def cost(self): pass

class CondimentDecorator(Beverage):
  def getDescription(self): pass

class Espresso(Beverage):
  def __init__(self):
    self.description = "エスプレッソ"

  def cost(self):
    return 1.99


class HouseBlend(Beverage):
  def __init__(self):
    self.description = "ハウスブレンド"

  def cost(self):
    return 0.89

class DarkRoast(Beverage):
  def __init__(self):
    self.description = "ダークロースト"

  def cost(self):
    return 0.99

class Decaf(Beverage):
  def __init__(self):
    self.description = "カフェイン抜き"

  def cost(self):
    return 1.05

class Mocha(CondimentDecorator):

  def __init__(self, b):
    self.beverage = b

  def getDescription(self):
    return self.beverage.getDescription() + "、モカ"

  def cost(self):
    return 0.20 + self.beverage.cost()

class Whip(CondimentDecorator):

  def __init__(self, b):
    self.beverage = b

  def getDescription(self):
    return self.beverage.getDescription() + "、ホイップ"

  def cost(self):
    return 0.10 + self.beverage.cost()

class Soy(CondimentDecorator):

  def __init__(self, b):
    self.beverage = b

  def getDescription(self):
    return self.beverage.getDescription() + "、豆乳"

  def cost(self):
    return 0.15 + self.beverage.cost()

def main():
  beverage = Espresso()
  print "%s %s" % (beverage.getDescription(), beverage.cost())

  beverage2 = DarkRoast()
  beverage2 = Mocha( beverage2 )
  beverage2 = Mocha( beverage2 )
  beverage2 = Whip( beverage2 )
  print "%s %s" % (beverage2.getDescription(), beverage2.cost())

  beverage3 = HouseBlend()
  beverage3 = Soy( beverage3 )
  beverage3 = Mocha( beverage3 )
  beverage3 = Whip( beverage3 )
  print "%s %s" % (beverage3.getDescription(), beverage3.cost())

main()

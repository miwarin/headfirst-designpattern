#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 4章 Factory パターン - ヨタの日々(2009-05-06)
# http://www.area51.gr.jp/~rin/diary/?date=20090506#p04

class PizzaStore:
  def orderPizza(self, _type):
    self.pizza = self.createPizza(_type)
    self.pizza.prepare()
    self.pizza.bake()
    self.pizza.cut()
    self.pizza.box()
    return self.pizza

  def createPizza(self, _type): pass

class NYPizzaStore(PizzaStore):
  def createPizza(self, item):
    if item == "チーズ":
      return NYStyleCheesePizza()
##    elif item == "野菜":
##      return NYStyleVeggiePizza()
##    elif item == "クラム":
##      return NYStyleClamPizza()
##    elif item == "ペパロニ":
##      return NYStylePepperoniPizza()
    else:
      return None

class ChicagoPizzaStore(PizzaStore):
  def createPizza(self, item):
    if item == "チーズ":
      return ChicagoStyleCheesePizza()
##    elif item == "野菜":
##      return ChicagoStyleVeggiePizza()
##    elif item == "クラム":
##      return ChicagoStyleClamPizza()
##    elif item == "ペパロニ":
##      return ChicagoStylePepperoniPizza()
    else:
      return None

class CaliforniaPizzaStore(PizzaStore):
  def createPizza(self, item):
    if item == "チーズ":
      return CaliforniaStyleCheesePizza()
##    elif item == "野菜":
##      return CaliforniaStyleVeggiePizza()
##    elif item == "クラム":
##      return CaliforniaStyleClamPizza()
##    elif item == "ペパロニ":
##      return CaliforniaStylePepperoniPizza()
    else:
      return None


class Pizza:
  def __init__(self):
    self.name = None
    self.dough = None
    self.sauce = None
    self.toppings = None

  def prepare(self):
    print "%s を下処理" % (self.name)
    print "生地をこねる..."
    print "ソースを追加..."
    print "トッピングを追加:"
    for t in self.toppings:
      print " %s" % (t)

  def bake(self):
    print "350度で25分間焼く"

  def cut(self):
    print "ピザを扇形に切り分ける"

  def box(self):
    print "PizzaStore の正式な箱にピザを入れる"

  def getName(self):
    return self.name

class NYStyleCheesePizza(Pizza):
  def __init__(self):
    self.name = "ニューヨークスタイルのソース&チーズピザ"
    self.dough = "薄いクラスト生地"
    self.sauce = "マリナラソース"
    self.toppings = []
    self.toppings.append("粉レッジャーノチーズ")

class ChicagoStyleCheesePizza(Pizza):
  def __init__(self):
    self.name = "シカゴスタイルのディープディッシュチーズピザ"
    self.dough = "極厚クラスト生地"
    self.sauce = "プラムトマトソース"
    self.toppings = []
    self.toppings.append("刻んだモッツァレラチーズ")

  def cut(self):
    print "ピザを四角形に切り分ける"

def main():
  nyStore = NYPizzaStore()
  chicagoStore = ChicagoPizzaStore()
  pizza = nyStore.orderPizza("チーズ")
  print "イーサンの注文は %s" % (pizza.getName())
  pizza = chicagoStore.orderPizza("チーズ")
  print "ジョエルの注文は %s" % (pizza.getName())

main()

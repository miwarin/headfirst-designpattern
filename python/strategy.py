#!/usr/bin/python
# -*- coding: utf-8 -*-

# Python でデザインパターン - Strategy
# http://www.area51.gr.jp/~rin/diary/?date=20100725#p04

class Duck:
  def __init__(self):
    self.quack_behavior = None
    self.fly_behavior = None
  
  def __init__(self):
    pass

  def perform_fly(self):
    self.fly_behavior.fly()
  
  def perform_quack(self):
    self.quack_behavior.quack()

  def swim(self):
    print "すべての鴨は浮かびます。おとりの鴨でも!"

class FlyBehavior:
  def fly(self):
    pass

class FlyWithWings(FlyBehavior):
  def fly(self):
    print "飛んでいます!"


class FlyNoWay(FlyBehavior):
  def fly(self):
    print "飛べません!"

class QuackBehavior:
  def quack(self):
    pass

class Quack(QuackBehavior):
  def quack(sel):
    print "ガーガー"

class MuteQuack(QuackBehavior):
  def quack(self):
    print "<沈黙>>"

class Squack(QuackBehavior):
  def quack(self):
    print "キューキュー"


class MallardDuck(Duck):
  def __init__(self):
    self.quack_behavior = Quack()
    self.fly_behavior = FlyWithWings()

  def display(self):
    print "本物のマガモです"

def main():
  mallard = MallardDuck()
  mallard.perform_quack()
  mallard.perform_fly()

main()

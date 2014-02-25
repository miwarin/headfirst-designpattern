#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 10章 State パターン - ヨタの日々(2009-05-31)
# http://www.area51.gr.jp/~rin/diary/?date=20090531#p06

class State:
  def insertQuarter(self): pass

  def ejectQuarter(self): pass

  def turnCrank(self): pass

  def dispense(self): pass
  

class HasQuarterState(State):

  def __init__(self, gumballMachine):
    self.gumballMachine = gumballMachine

  def insertQuarter(self):
    print "もう一度25セントを投入することはできません"

  def ejectQuarter(self):
    print "25セントを返却します"
    self.gumballMachine.setState(self.gumballMachine.getNoQuarterState())

  def turnCrank(self):
    print "クランクを回しました..."
    self.gumballMachine.setState(self.gumballMachine.getSoldState())

  def dispense(self):
    print "販売するガムボールはありません"

  def __str__(self):
    return "waiting for turn of crank"

class NoQuarterState(State):

  def __init__(self, gumballMachine):
    self.gumballMachine = gumballMachine


  def insertQuarter(self):
    print "25セントを投入しました"
    self.gumballMachine.setState( self.gumballMachine.getHasQuarterState())

  def ejectQuarter(self):
    print "25セントを投入していません"

  def turnCrank(self):
    print "クランクを回しましたが、25セントを投入していません"

  def dispense(self):
    print "まず支払いをする必要があります"

  def __str__(self):
    return "25セントが投入されるのを待っています"

class SoldOutState(State):

  def __init__(self, gumballMachine):
    self.gumballMachine = gumballMachine

  def insertQuarter(self):
    print "25セントを投入することはできません。このマシンは売り切れです"

  def ejectQuarter(self):
    print "返金できません。まだ25セントを投入していません"

  def turnCrank(self):
    print "クランクを回しましたが、ガムボールがありません"

  def dispense(self):
    print "販売するガムボールはありません"

  def __str__(self):
    return "売り切れです"

class SoldState(State):

  def __init__(self, gumballMachine):
    self.gumballMachine = gumballMachine

  def insertQuarter(self):
    print "お待ちください。すでにガムボールを出しています"

  def ejectQuarter(self):
    print "申し訳ありません。すでにクランクを回しています"

  def turnCrank(self):
    print "2回回してもガムボールをもう1つ入手することはできません！"

  def dispense(self):
    self.gumballMachine.releaseBall
    if self.gumballMachine.getCount() > 0:
      self.gumballMachine.setState(self.gumballMachine.getNoQuarterState())
    else:
      print "おっと、ガムボールがなくなりました！"
      self.gumballMachine.setState(self.gumballMachine.getSoldOutState())

  def __str__(self):
    "dispensing a gumball"

class GumballMachine:
  def __init__(self, numberGumballs):
    self.soldOutState = SoldOutState( self )
    self.noQuarterState = NoQuarterState( self )
    self.hasQuarterState = HasQuarterState( self )
    self.soldState = SoldState( self )
    self.state = self.soldOutState

    self.count = numberGumballs
    if  numberGumballs > 0:
      self.state = self.noQuarterState

  def insertQuarter(self):
    self.state.insertQuarter()

  def ejectQuarter(self):
    self.state.ejectQuarter()

  def turnCrank(self):
    self.state.turnCrank()
    self.state.dispense()

  def setState(self, state):
    self.state = state

  def releaseBall(self):
    print "ガムボールがスロットから転がり出てきます"
    if self.count != 0:
      self.count = self.count - 1

  def getCount(self):
    return self.count

  def refill(self, count):
    self.count = count
    self.state = self.noQuarterState

  def getState(self):
    return self.state

  def getSoldOutState(self):
    return self.soldOutState

  def getNoQuarterState(self):
    return self.noQuarterState

  def getHasQuarterState(self):
    return self.hasQuarterState

  def getSoldState(self):
    return self.soldState
    
  def __str__(self):
    result = ""
    result += "\nMighty Gumball, Inc."
    result += "\nJava対応据付型ガムボール モデル #2004"
    result += "\n在庫: #{self.count} 個のガムボール"
    result += "\nマシンは%s" % (self.state)
    return result


def main():

    gumballMachine = GumballMachine( 5 )
    print gumballMachine

    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    print gumballMachine

    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    print gumballMachine

main()

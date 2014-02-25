#!/usr/bin/ruby -Ks

module State
  def insertQuarter
  end
  
  def ejectQuarter
  end
  
  def turnCrank
  end
  
  def dispense
  end
  
  def to_s
  end
  
end

class HasQuarterState
  include State

  def initialize( gumballMachine )
    @gumballMachine = gumballMachine
  end
  
  def insertQuarter
    puts "もう一度25セントを投入することはできません"
  end
 
  def ejectQuarter
    puts "25セントを返却します"
    @gumballMachine.setState( @gumballMachine.getNoQuarterState )
  end

  def turnCrank
    puts "クランクを回しました..."
    @gumballMachine.setState( @gumballMachine.getSoldState )
  end

  def dispense
    puts "販売するガムボールはありません"
  end

  def to_s
    "waiting for turn of crank"
  end
end

class NoQuarterState
  include State

  def initialize( gumballMachine )
    @gumballMachine = gumballMachine
  end

  def insertQuarter
    puts "25セントを投入しました"
    @gumballMachine.setState( @gumballMachine.getHasQuarterState )
  end
  
  def ejectQuarter
    puts "25セントを投入していません"
  end
  
  def turnCrank
    puts "クランクを回しましたが、25セントを投入していません"
  end
  
  def dispense
    puts "まず支払いをする必要があります"
  end
  
  def to_s
    "25セントが投入されるのを待っています"
  end
  
end

class SoldOutState
  include State

  def initialize( gumballMachine )
    @gumballMachine = gumballMachine
  end

  def insertQuarter
    puts "25セントを投入することはできません。このマシンは売り切れです"
  end
  
  def ejectQuarter
    puts "返金できません。まだ25セントを投入していません"
  end
  
  def turnCrank
    puts "クランクを回しましたが、ガムボールがありません"
  end
  
  def dispense
    puts "販売するガムボールはありません"
  end
  
  def to_s
    "売り切れです"
  end
end


class SoldState
  include State

  def initialize( gumballMachine )
    @gumballMachine = gumballMachine
  end

  def insertQuarter
    puts "お待ちください。すでにガムボールを出しています"
  end
  
  def ejectQuarter
    puts "申し訳ありません。すでにクランクを回しています"
  end
  
  def turnCrank
    puts "2回回してもガムボールをもう1つ入手することはできません！"
  end
  
  def dispense
    @gumballMachine.releaseBall
    if @gumballMachine.getCount > 0
      @gumballMachine.setState( @gumballMachine.getNoQuarterState )
    else
      puts "おっと、ガムボールがなくなりました！"
      @gumballMachine.setState( @gumballMachine.getSoldOutState )
    end
  end
  
  def to_s
    "dispensing a gumball"
  end
end


class GumballMachine
  def initialize( numberGumballs )
    @soldOutState = SoldOutState.new( self )
    @noQuarterState = NoQuarterState.new( self )
    @hasQuarterState = HasQuarterState.new( self )
    @soldState = SoldState.new( self )
    @state = @soldOutState

    @count = numberGumballs
    if  numberGumballs > 0
      @state = @noQuarterState
    end
  end
 
  def insertQuarter
    @state.insertQuarter
  end

  def ejectQuarter
    @state.ejectQuarter
  end

  def turnCrank
    @state.turnCrank
    @state.dispense
  end

  def setState( state )
    @state = state
  end

  def releaseBall
    puts "ガムボールがスロットから転がり出てきます"
    if @count != 0
      @count = @count - 1
    end
  end

  def getCount
    @count
  end

  def refill( count )
    @count = count
    @state = @noQuarterState
  end

  def getState
    @state
  end

  def getSoldOutState
    @soldOutState
  end
  
  def getNoQuarterState
    @noQuarterState
  end

  def getHasQuarterState
    @hasQuarterState
  end

  def getSoldState
    @soldState
  end

  def to_s
    result = ""
    result << "\nMighty Gumball, Inc."
    result << "\nJava対応据付型ガムボール モデル #2004"
    result << "\n在庫: #{@count} 個のガムボール"
    result << "\nマシンは#{@state.to_s}"
    result
  end
end

def main

    gumballMachine = GumballMachine.new( 5 )

    puts gumballMachine

    gumballMachine.insertQuarter
    gumballMachine.turnCrank

    puts gumballMachine

    gumballMachine.insertQuarter
    gumballMachine.turnCrank
    gumballMachine.insertQuarter
    gumballMachine.turnCrank

    puts gumballMachine
end

main


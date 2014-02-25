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
    puts "������x25�Z���g�𓊓����邱�Ƃ͂ł��܂���"
  end
 
  def ejectQuarter
    puts "25�Z���g��ԋp���܂�"
    @gumballMachine.setState( @gumballMachine.getNoQuarterState )
  end

  def turnCrank
    puts "�N�����N���񂵂܂���..."
    @gumballMachine.setState( @gumballMachine.getSoldState )
  end

  def dispense
    puts "�̔�����K���{�[���͂���܂���"
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
    puts "25�Z���g�𓊓����܂���"
    @gumballMachine.setState( @gumballMachine.getHasQuarterState )
  end
  
  def ejectQuarter
    puts "25�Z���g�𓊓����Ă��܂���"
  end
  
  def turnCrank
    puts "�N�����N���񂵂܂������A25�Z���g�𓊓����Ă��܂���"
  end
  
  def dispense
    puts "�܂��x����������K�v������܂�"
  end
  
  def to_s
    "25�Z���g�����������̂�҂��Ă��܂�"
  end
  
end

class SoldOutState
  include State

  def initialize( gumballMachine )
    @gumballMachine = gumballMachine
  end

  def insertQuarter
    puts "25�Z���g�𓊓����邱�Ƃ͂ł��܂���B���̃}�V���͔���؂�ł�"
  end
  
  def ejectQuarter
    puts "�ԋ��ł��܂���B�܂�25�Z���g�𓊓����Ă��܂���"
  end
  
  def turnCrank
    puts "�N�����N���񂵂܂������A�K���{�[��������܂���"
  end
  
  def dispense
    puts "�̔�����K���{�[���͂���܂���"
  end
  
  def to_s
    "����؂�ł�"
  end
end


class SoldState
  include State

  def initialize( gumballMachine )
    @gumballMachine = gumballMachine
  end

  def insertQuarter
    puts "���҂����������B���łɃK���{�[�����o���Ă��܂�"
  end
  
  def ejectQuarter
    puts "�\���󂠂�܂���B���łɃN�����N���񂵂Ă��܂�"
  end
  
  def turnCrank
    puts "2��񂵂Ă��K���{�[��������1���肷�邱�Ƃ͂ł��܂���I"
  end
  
  def dispense
    @gumballMachine.releaseBall
    if @gumballMachine.getCount > 0
      @gumballMachine.setState( @gumballMachine.getNoQuarterState )
    else
      puts "�����ƁA�K���{�[�����Ȃ��Ȃ�܂����I"
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
    puts "�K���{�[�����X���b�g����]����o�Ă��܂�"
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
    result << "\nJava�Ή����t�^�K���{�[�� ���f�� #2004"
    result << "\n�݌�: #{@count} �̃K���{�[��"
    result << "\n�}�V����#{@state.to_s}"
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


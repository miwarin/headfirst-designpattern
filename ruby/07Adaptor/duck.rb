#!/usr/bin/ruby -Ks

module Duck
  def quack
  end
  
  def fly
  end
end

class MallardDuck
  include Duck
  
  def quack
    puts "�K�[�K�["
  end
  
  def fly
    puts "���ł��܂�"
  end
end

module Turkey
  def gobble
  end
  
  def fly
  end
end

class WildTurkey
  include Turkey
  
  def gobble
    puts "�S���S��"
  end
  
  def fly
    puts "�Z����������ł��܂�"
  end
end

class TurkeyAdapter
  include Duck
  
  def initialize( turkey )
    @turkey = turkey
  end
  
  def quack
    @turkey.gobble
  end
  
  def fly
    5.times do
      @turkey.fly
    end
  end
end

def main
  duck = MallardDuck.new
  turkey = WildTurkey.new
  turkeyAdapter = TurkeyAdapter.new( turkey )
  
  puts "Turky �̏o��..."
  turkey.gobble
  turkey.fly
  
  puts "\nDuck �̏o��..."
  testDuck( duck )
  
  puts "\nTurkeyAdapter �̏o��..."
  testDuck( turkeyAdapter )
end

def testDuck( duck )
  duck.quack
  duck.fly
end

main


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
    puts "ガーガー"
  end
  
  def fly
    puts "飛んでいます"
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
    puts "ゴロゴロ"
  end
  
  def fly
    puts "短い距離を飛んでいます"
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
  
  puts "Turky の出力..."
  turkey.gobble
  turkey.fly
  
  puts "\nDuck の出力..."
  testDuck( duck )
  
  puts "\nTurkeyAdapter の出力..."
  testDuck( turkeyAdapter )
end

def testDuck( duck )
  duck.quack
  duck.fly
end

main


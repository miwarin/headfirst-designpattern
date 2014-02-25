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
    puts "ƒK[ƒK["
  end
  
  def fly
    puts "”ò‚ñ‚Å‚¢‚Ü‚·"
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
    puts "ƒSƒƒSƒ"
  end
  
  def fly
    puts "’Z‚¢‹——£‚ğ”ò‚ñ‚Å‚¢‚Ü‚·"
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
  
  puts "Turky ‚Ìo—Í..."
  turkey.gobble
  turkey.fly
  
  puts "\nDuck ‚Ìo—Í..."
  testDuck( duck )
  
  puts "\nTurkeyAdapter ‚Ìo—Í..."
  testDuck( turkeyAdapter )
end

def testDuck( duck )
  duck.quack
  duck.fly
end

main


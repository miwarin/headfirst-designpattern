#!/usr/bin/ruby -Ks

class Duck
  @@quackBehavior = nil
  @@flyBehavior = nil
  
  def initialize
  end
  
  def performFly
    @@flyBehavior.fly
  end

  def performQuack
    @@quackBehavior.quack
  end
  
  def swim
    puts "すべての鴨は浮かびます。おとりの鴨でも!"
  end
end

class FlyBehavior
  def fly
  end
end

class FlyWithWings < FlyBehavior
  def fly
    puts "飛んでいます!"
  end
end

class FlyNoWay < FlyBehavior
  def fly
    puts "飛べません!"
  end
end

class QuackBehavior
  def quack
  end
end

class Quack < QuackBehavior
  def quack
    puts "ガーガー"
  end
end

class MuteQuack < QuackBehavior
  def quack
    puts "<沈黙>>"
  end
end

class Squack < QuackBehavior
  def quack
    puts "キューキュー"
  end
end

class MallardDuck < Duck
  def initialize
    @@quackBehavior = Quack.new
    @@flyBehavior = FlyWithWings.new
  end
  
  def display
    puts "本物のマガモです"
  end
end

def main
  mallard = MallardDuck.new
  mallard.performQuack
  mallard.performFly
end

main


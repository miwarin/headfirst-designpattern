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
    puts "���ׂĂ̊��͕����т܂��B���Ƃ�̊��ł�!"
  end
end

class FlyBehavior
  def fly
  end
end

class FlyWithWings < FlyBehavior
  def fly
    puts "���ł��܂�!"
  end
end

class FlyNoWay < FlyBehavior
  def fly
    puts "��ׂ܂���!"
  end
end

class QuackBehavior
  def quack
  end
end

class Quack < QuackBehavior
  def quack
    puts "�K�[�K�["
  end
end

class MuteQuack < QuackBehavior
  def quack
    puts "<����>>"
  end
end

class Squack < QuackBehavior
  def quack
    puts "�L���[�L���["
  end
end

class MallardDuck < Duck
  def initialize
    @@quackBehavior = Quack.new
    @@flyBehavior = FlyWithWings.new
  end
  
  def display
    puts "�{���̃}�K���ł�"
  end
end

def main
  mallard = MallardDuck.new
  mallard.performQuack
  mallard.performFly
end

main


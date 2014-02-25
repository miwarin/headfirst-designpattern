#!/usr/bin/ruby -Ks

class Beverage
  @description = "不明な飲み物"
  
  def getDescription
    @description;
  end
  
  def cost
  end
end

class CondimentDecorator < Beverage
  def getDescription
  end
end

class Espresso < Beverage
  def initialize
    @description = "エスプレッソ"
  end
  
  def cost
    1.99
  end
end

class HouseBlend < Beverage
  def initialize
    @description = "ハウスブレンド"
  end
  
  def cost
    0.89
  end
end

class DarkRoast < Beverage
  def initialize
    @description = "ダークロースト"
  end
  
  def cost
    0.99
  end
end

class Decaf < Beverage
  def initialize
    @description = "カフェイン抜き"
  end
  
  def cost
    1.05
  end
end

class Mocha < CondimentDecorator
  @beverage
  
  def initialize( b )
    @beverage = b
  end
  
  def getDescription
    @beverage.getDescription + "、モカ"
  end
  
  def cost
    0.20 + @beverage.cost
  end
end

class Whip < CondimentDecorator
  @beverage
  
  def initialize( b )
    @beverage = b
  end
  
  def getDescription
    @beverage.getDescription + "、ホイップ"
  end
  
  def cost
    0.10 + @beverage.cost
  end
end

class Soy < CondimentDecorator
  @beverage
  
  def initialize( b )
    @beverage = b
  end
  
  def getDescription
    @beverage.getDescription + "、豆乳"
  end
  
  def cost
    0.15 + @beverage.cost
  end
end


def main
  beverage = Espresso.new
  puts "#{beverage.getDescription} $#{beverage.cost}"
  
  beverage2 = DarkRoast.new
  beverage2 = Mocha.new( beverage2 )
  beverage2 = Mocha.new( beverage2 )
  beverage2 = Whip.new( beverage2 )
  puts "#{beverage2.getDescription} $#{beverage2.cost}"
  
  beverage3 = HouseBlend.new
  beverage3 = Soy.new( beverage3 )
  beverage3 = Mocha.new( beverage3 )
  beverage3 = Whip.new( beverage3 )
  puts "#{beverage3.getDescription} $#{beverage3.cost}"
end

main



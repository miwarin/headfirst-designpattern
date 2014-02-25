#!/usr/bin/ruby -Ks

class Beverage
  @description = "�s���Ȉ��ݕ�"
  
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
    @description = "�G�X�v���b�\"
  end
  
  def cost
    1.99
  end
end

class HouseBlend < Beverage
  def initialize
    @description = "�n�E�X�u�����h"
  end
  
  def cost
    0.89
  end
end

class DarkRoast < Beverage
  def initialize
    @description = "�_�[�N���[�X�g"
  end
  
  def cost
    0.99
  end
end

class Decaf < Beverage
  def initialize
    @description = "�J�t�F�C������"
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
    @beverage.getDescription + "�A���J"
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
    @beverage.getDescription + "�A�z�C�b�v"
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
    @beverage.getDescription + "�A����"
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



#!/usr/bin/ruby -Ks

module Veggies
  def to_s
  end
end

class Garlic
  include Veggies
  def to_s
    "Garlic"
  end
end

module Dough
  def to_s
  end
end

class ThinCrustDough
  include Dough
  def to_s
    "ThinCrustDough"
  end
end

class ThickCrustDough
  include Dough
  def to_s
    "ThickCrustDough"
  end
end

module PizzaIngredientFactory
  def createDough
  end
  def createSauce
  end
  def createCheese
  end
  def createVeggies
  end
  def createPapperoni
  end
  def createClam
  end
end

class NYPizzaIngredientFactory
  include PizzaIngredientFactory

  def createDough
    ThinCrustDough.new
  end
  def createSauce
#    MarinaraSauce.new
  end
  def createCheese
#    ReggianoCheese.new
  end
  def createVeggies
#    veggies = [ Garlic.new, Onion.new, Mushroom.new, RedPepper.new ]
  end
  def createPapperoni
#    SlicedPepperoni.new
  end
  def createClam
#    FreshClams.new
  end
end

class ChicagoPizzaIngredientFactory
  include PizzaIngredientFactory

  def createDough
    ThickCrustDough.new
  end
  def createSauce
#    PlumTomatoSauce.new
  end
  def createCheese
#    MozzarellaCheese.new
  end
  def createVeggies
#    veggies = [ BlackOlives.new, Spinach.new, Eggplant.new ]
  end
  def createPapperoni
#    SlicedPepperoni.new
  end
  def createClam
#    FrozenClams.new
  end
end


class PizzaStore
  def orderPizza( type )
    @pizza = createPizza( type )
    @pizza.prepare
    @pizza.bake
    @pizza.cut
    @pizza.box
    @pizza
  end
  
  def createPizza( type )
  end
end

class NYPizzaStore < PizzaStore
  def createPizza( item )
    pizza = nil
    ingredientFactory = NYPizzaIngredientFactory.new
    
    case item
    when "�`�[�Y"
      pizza = CheesePizza.new( ingredientFactory )
      pizza.setName( "�j���[���[�N�X�^�C���`�[�Y�s�U" )
##    when "���"
##      pizza = VeggiePizza( ingredientFactory )
##      pizza.setName( "�j���[���[�N�X�^�C����؃s�U"
##    when "�N����"
##      pizza = ClamPizza( ingredientFactory )
##      pizza.setName( "�j���[���[�N�X�^�C���N�����s�U"
##    when "�y�p���j"
##      pizza = PepperoniePizza( ingredientFactory )
##      pizza.setName( "�j���[���[�N�X�^�C���y�p���j�s�U"
    else
      pizza = nil
    end
    
    pizza
    
  end
end

class ChicagoPizzaStore < PizzaStore
  def createPizza( item )
    pizza = nil
    ingredientFactory = ChicagoPizzaIngredientFactory.new
    
    case item
    when "�`�[�Y"
      pizza = CheesePizza.new( ingredientFactory )
      pizza.setName( "�j���[���[�N�X�^�C���`�[�Y�s�U" )
##    when "���"
##      pizza = VeggiePizza( ingredientFactory )
##      pizza.setName( "�j���[���[�N�X�^�C����؃s�U"
##    when "�N����"
##      pizza = ClamPizza( ingredientFactory )
##      pizza.setName( "�j���[���[�N�X�^�C���N�����s�U"
##    when "�y�p���j"
##      pizza = PepperoniePizza( ingredientFactory )
##      pizza.setName( "�j���[���[�N�X�^�C���y�p���j�s�U"
    else
      pizza = nil
    end
    
    pizza
    
  end
end

class Pizza
  @name
  @dough
  @sauce
  @toppings = []
  @veggies = []
  @cheese
  @pepperoni
  @clam
  
  def prepare
  end
  
  def bake
    puts "350�x��25���ԏĂ�"
  end
  
  def cut
    puts "�s�U���`�ɐ؂蕪����"
  end
  
  def box
    puts "PizzaStore �̐����Ȕ��Ƀs�U������"
  end
  
  def setName( name )
    @name = name
  end

  def getName
    @name
  end
end

class CheesePizza < Pizza
  @ingredientFactory
  
  def initialize( ingredientFactory )
    @ingredientFactory = ingredientFactory
  end
  
  def prepare
    puts "#{@name}��������"
    @dough = @ingredientFactory.createDough
    @sauce = @ingredientFactory.createSauce
    @cheese = @ingredientFactory.createCheese
  end
end

class ClamPizza < Pizza
  @ingredientFactory
  
  def initialize( ingredientFactory )
    @ingredientFactory = ingredientFactory
  end
  
  def prepare
    puts "#{@name}��������"
    @dough = @ingredientFactory.createDough
    @sauce = @ingredientFactory.createSauce
    @cheese = @ingredientFactory.createCheese
    @clam = @ingredientFactory.createClam
  end
end

def main
  nyStore = NYPizzaStore.new
  chicagoStore = ChicagoPizzaStore.new
  pizza = nyStore.orderPizza( "�`�[�Y" )
  puts "�C�[�T���̒�����#{pizza.getName}"
  pizza = chicagoStore.orderPizza( "�`�[�Y" )
  puts "�W���G���̒�����#{pizza.getName}"
end

main


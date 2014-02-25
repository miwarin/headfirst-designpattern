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
    when "チーズ"
      pizza = CheesePizza.new( ingredientFactory )
      pizza.setName( "ニューヨークスタイルチーズピザ" )
##    when "野菜"
##      pizza = VeggiePizza( ingredientFactory )
##      pizza.setName( "ニューヨークスタイル野菜ピザ"
##    when "クラム"
##      pizza = ClamPizza( ingredientFactory )
##      pizza.setName( "ニューヨークスタイルクラムピザ"
##    when "ペパロニ"
##      pizza = PepperoniePizza( ingredientFactory )
##      pizza.setName( "ニューヨークスタイルペパロニピザ"
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
    when "チーズ"
      pizza = CheesePizza.new( ingredientFactory )
      pizza.setName( "ニューヨークスタイルチーズピザ" )
##    when "野菜"
##      pizza = VeggiePizza( ingredientFactory )
##      pizza.setName( "ニューヨークスタイル野菜ピザ"
##    when "クラム"
##      pizza = ClamPizza( ingredientFactory )
##      pizza.setName( "ニューヨークスタイルクラムピザ"
##    when "ペパロニ"
##      pizza = PepperoniePizza( ingredientFactory )
##      pizza.setName( "ニューヨークスタイルペパロニピザ"
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
    puts "350度で25分間焼く"
  end
  
  def cut
    puts "ピザを扇形に切り分ける"
  end
  
  def box
    puts "PizzaStore の正式な箱にピザを入れる"
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
    puts "#{@name}を下処理"
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
    puts "#{@name}を下処理"
    @dough = @ingredientFactory.createDough
    @sauce = @ingredientFactory.createSauce
    @cheese = @ingredientFactory.createCheese
    @clam = @ingredientFactory.createClam
  end
end

def main
  nyStore = NYPizzaStore.new
  chicagoStore = ChicagoPizzaStore.new
  pizza = nyStore.orderPizza( "チーズ" )
  puts "イーサンの注文は#{pizza.getName}"
  pizza = chicagoStore.orderPizza( "チーズ" )
  puts "ジョエルの注文は#{pizza.getName}"
end

main


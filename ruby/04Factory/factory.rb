#!/usr/bin/ruby -Ks

class PizzaStore
  def orderPizza( type )
    @pizza
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
    case item
    when "チーズ"
      NYStyleCheesePizza.new
##    when "野菜"
##      NYStyleVeggiePizza.new
##    when "クラム"
##      NYStyleClamPizza.new
##    when "ペパロニ"
##      NYStylePepperoniPizza.new
    else
      nil
    end
  end
end

class ChicagoPizzaStore < PizzaStore
  def createPizza( item )
    case item
    when "チーズ"
      ChicagoStyleCheesePizza.new
##    when "野菜"
##      ChicagoStyleVeggiePizza.new
##    when "クラム"
##      ChicagoStyleClamPizza.new
##    when "ペパロニ"
##      ChicagoStylePepperoniPizza.new
    else
      nil
    end
  end
end

class CaliforniaPizzaStore < PizzaStore
  def createPizza( item )
    case item
    when "チーズ"
      CaliforniaStyleCheesePizza.new
    when "野菜"
      CaliforniaStyleVeggiePizza.new
    when "クラム"
      CaliforniaStyleClamPizza.new
    when "ペパロニ"
      CaliforniaStylePepperoniPizza.new
    else
      nil
    end
  end
end

class Pizza
  @name
  @dough
  @sauce
  @toppings
  
  def prepare
    puts "#{@name}を下処理"
    puts "生地をこねる..."
    puts "ソースを追加..."
    puts "トッピングを追加:"
    @toppings.each {|t|
      puts " #{t}"
    }
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
  
  def getName
    @name
  end
end

class NYStyleCheesePizza < Pizza
  def initialize
    @name = "ニューヨークスタイルのソース&チーズピザ"
    @dough = "薄いクラスト生地"
    @sauce = "マリナラソース"
    @toppings = []
    @toppings << "粉レッジャーノチーズ"
  end
end

class ChicagoStyleCheesePizza < Pizza
  def initialize
    @name = "シカゴスタイルのディープディッシュチーズピザ"
    @dough = "極厚クラスト生地"
    @sauce = "プラムトマトソース"
    @toppings = []
    @toppings << "刻んだモッツァレラチーズ"
  end
  
  def cut
    puts "ピザを四角形に切り分ける"
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


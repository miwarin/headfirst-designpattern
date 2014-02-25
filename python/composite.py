#!/usr/bin/python
# -*- coding: utf-8 -*-

Head First デザインパターンを写経する - 9章 Composite パターン - ヨタの日々(2009-05-18) http://www.area51.gr.jp/~rin/diary/?date=20090518#p03

class MenuComponent
  def add( menuComponent )
    raise "unsupported operation"
  end
  def remove( menuComponent )
    raise "unsupported operation"
  end
  def getChild( i )
    raise "unsupported operation"
  end
  def getName
    raise "unsupported operation"
  end
  def getDescription
    raise "unsupported operation"
  end
  def getPrice
    raise "unsupported operation"
  end
  def isVegetarian
    raise "unsupported operation"
  end
  def Print
    raise "unsupported operation"
  end
end

class Menu < MenuComponent
  def initialize( name, description )
    @name = name
    @description = description
    @menuComponents = []
  end

  def add( menuComponent )
    @menuComponents << menuComponent
  end

  def remove( menuComponent )
    @menuComponents.delete( menuComponent )
  end

  def getChild( i )
    @menuComponents[ i ]
  end

  def getName
    @name
  end

  def getDescription
    @description
  end

  def Print
    puts "\n#{getName}"
    puts " #{@getDescription}"
    puts "---------------------"
    @menuComponents.each{ |menuComponent|
      menuComponent.Print
    }
  end
end

class MenuItem < MenuComponent
  def initialize( name, description, vegetarian, price )
    @name = name
    @description = description
    @vegetarian = vegetarian
    @price = price
  end

  def getName
    @name
  end

  def getDescription
    @description
  end

  def getPrice
    @price
  end

  def isVegetarian
    @vegetarian
  end

  def Print
    print "  ", getName
    if isVegetarian
      print "(v)"
    end
    puts ", #{getPrice}"
    puts "     -- #{getDescription}"
  end
end


class Waitress
  def initialize( allMenus )
    @allMenus = allMenus
  end

  def printMenu
    @allMenus.Print
  end
end

def main
  pancakeHouseMenu = Menu.new( "PANCAKE HOUSE MENU", "Breakfast" )
  dinerMenu = Menu.new("DINER MENU", "Lunch")
  cafeMenu = Menu.new("CAFE MENU", "Dinner")
  dessertMenu = Menu.new("DESSERT MENU", "Dessert of course!")
  coffeeMenu = Menu.new("COFFEE MENU", "Stuff to go with your afternoon coffee")
  allMenus = Menu.new("ALL MENUS", "All menus combined")

  allMenus.add( pancakeHouseMenu )
  allMenus.add( dinerMenu )
  allMenus.add( cafeMenu )

  pancakeHouseMenu.add(MenuItem.new(
    "K&B's Pancake Breakfast",
    "Pancakes with scrambled eggs, and toast",
    true,
    2.99))
  pancakeHouseMenu.add(MenuItem.new(
    "Regular Pancake Breakfast",
    "Pancakes with fried eggs, sausage",
    false,
    2.99))
  pancakeHouseMenu.add(MenuItem.new(
    "Blueberry Pancakes",
    "Pancakes made with fresh blueberries, and blueberry syrup",
    true,
    3.49))
  pancakeHouseMenu.add(MenuItem.new(
    "Waffles",
    "Waffles, with your choice of blueberries or strawberries",
    true,
    3.59))

  dinerMenu.add(MenuItem.new(
    "Vegetarian BLT",
    "(Fakin') Bacon with lettuce & tomato on whole wheat",
    true,
    2.99))
  dinerMenu.add(MenuItem.new(
    "BLT",
    "Bacon with lettuce & tomato on whole wheat",
    false,
    2.99))
  dinerMenu.add(MenuItem.new(
    "Soup of the day",
    "A bowl of the soup of the day, with a side of potato salad",
    false,
    3.29))
  dinerMenu.add(MenuItem.new(
    "Hotdog",
    "A hot dog, with saurkraut, relish, onions, topped with cheese",
    false,
    3.05))
  dinerMenu.add(MenuItem.new(
    "Steamed Veggies and Brown Rice",
    "Steamed vegetables over brown rice",
    true,
    3.99))

  dinerMenu.add(MenuItem.new(
    "Pasta",
    "Spaghetti with Marinara Sauce, and a slice of sourdough bread",
    true,
    3.89))

  dinerMenu.add(dessertMenu)

  dessertMenu.add(MenuItem.new(
    "Apple Pie",
    "Apple pie with a flakey crust, topped with vanilla icecream",
    true,
    1.59))

  dessertMenu.add(MenuItem.new(
    "Cheesecake",
    "Creamy New York cheesecake, with a chocolate graham crust",
    true,
    1.99))
  dessertMenu.add(MenuItem.new(
    "Sorbet",
    "A scoop of raspberry and a scoop of lime",
    true,
    1.89))

  cafeMenu.add(MenuItem.new(
    "Veggie Burger and Air Fries",
    "Veggie burger on a whole wheat bun, lettuce, tomato, and fries",
    true,
    3.99))
  cafeMenu.add(MenuItem.new(
    "Soup of the day",
    "A cup of the soup of the day, with a side salad",
    false,
    3.69))
  cafeMenu.add(MenuItem.new(
    "Burrito",
    "A large burrito, with whole pinto beans, salsa, guacamole",
    true,
    4.29))

  cafeMenu.add(coffeeMenu)

  coffeeMenu.add(MenuItem.new(
    "Coffee Cake",
    "Crumbly cake topped with cinnamon and walnuts",
    true,
    1.59))
  coffeeMenu.add(MenuItem.new(
    "Bagel",
    "Flavors include sesame, poppyseed, cinnamon raisin, pumpkin",
    false,
    0.69))
  coffeeMenu.add(MenuItem.new(
    "Biscotti",
    "Three almond or hazelnut biscotti cookies",
    true,
    0.89))

  waitress = Waitress.new(allMenus)
  waitress.printMenu()
end

mainclass MenuComponent
  def add( menuComponent )
    raise "unsupported operation"
  end
  def remove( menuComponent )
    raise "unsupported operation"
  end
  def getChild( i )
    raise "unsupported operation"
  end
  def getName
    raise "unsupported operation"
  end
  def getDescription
    raise "unsupported operation"
  end
  def getPrice
    raise "unsupported operation"
  end
  def isVegetarian
    raise "unsupported operation"
  end
  def Print
    raise "unsupported operation"
  end
end

class Menu < MenuComponent
  def initialize( name, description )
    @name = name
    @description = description
    @menuComponents = []
  end

  def add( menuComponent )
    @menuComponents << menuComponent
  end

  def remove( menuComponent )
    @menuComponents.delete( menuComponent )
  end

  def getChild( i )
    @menuComponents[ i ]
  end

  def getName
    @name
  end

  def getDescription
    @description
  end

  def Print
    puts "\n#{getName}"
    puts " #{@getDescription}"
    puts "---------------------"
    @menuComponents.each{ |menuComponent|
      menuComponent.Print
    }
  end
end

class MenuItem < MenuComponent
  def initialize( name, description, vegetarian, price )
    @name = name
    @description = description
    @vegetarian = vegetarian
    @price = price
  end

  def getName
    @name
  end

  def getDescription
    @description
  end

  def getPrice
    @price
  end

  def isVegetarian
    @vegetarian
  end

  def Print
    print "  ", getName
    if isVegetarian
      print "(v)"
    end
    puts ", #{getPrice}"
    puts "     -- #{getDescription}"
  end
end


class Waitress
  def initialize( allMenus )
    @allMenus = allMenus
  end

  def printMenu
    @allMenus.Print
  end
end

def main
  pancakeHouseMenu = Menu.new( "PANCAKE HOUSE MENU", "Breakfast" )
  dinerMenu = Menu.new("DINER MENU", "Lunch")
  cafeMenu = Menu.new("CAFE MENU", "Dinner")
  dessertMenu = Menu.new("DESSERT MENU", "Dessert of course!")
  coffeeMenu = Menu.new("COFFEE MENU", "Stuff to go with your afternoon coffee")
  allMenus = Menu.new("ALL MENUS", "All menus combined")

  allMenus.add( pancakeHouseMenu )
  allMenus.add( dinerMenu )
  allMenus.add( cafeMenu )

  pancakeHouseMenu.add(MenuItem.new(
    "K&B's Pancake Breakfast",
    "Pancakes with scrambled eggs, and toast",
    true,
    2.99))
  pancakeHouseMenu.add(MenuItem.new(
    "Regular Pancake Breakfast",
    "Pancakes with fried eggs, sausage",
    false,
    2.99))
  pancakeHouseMenu.add(MenuItem.new(
    "Blueberry Pancakes",
    "Pancakes made with fresh blueberries, and blueberry syrup",
    true,
    3.49))
  pancakeHouseMenu.add(MenuItem.new(
    "Waffles",
    "Waffles, with your choice of blueberries or strawberries",
    true,
    3.59))

  dinerMenu.add(MenuItem.new(
    "Vegetarian BLT",
    "(Fakin') Bacon with lettuce & tomato on whole wheat",
    true,
    2.99))
  dinerMenu.add(MenuItem.new(
    "BLT",
    "Bacon with lettuce & tomato on whole wheat",
    false,
    2.99))
  dinerMenu.add(MenuItem.new(
    "Soup of the day",
    "A bowl of the soup of the day, with a side of potato salad",
    false,
    3.29))
  dinerMenu.add(MenuItem.new(
    "Hotdog",
    "A hot dog, with saurkraut, relish, onions, topped with cheese",
    false,
    3.05))
  dinerMenu.add(MenuItem.new(
    "Steamed Veggies and Brown Rice",
    "Steamed vegetables over brown rice",
    true,
    3.99))

  dinerMenu.add(MenuItem.new(
    "Pasta",
    "Spaghetti with Marinara Sauce, and a slice of sourdough bread",
    true,
    3.89))

  dinerMenu.add(dessertMenu)

  dessertMenu.add(MenuItem.new(
    "Apple Pie",
    "Apple pie with a flakey crust, topped with vanilla icecream",
    true,
    1.59))

  dessertMenu.add(MenuItem.new(
    "Cheesecake",
    "Creamy New York cheesecake, with a chocolate graham crust",
    true,
    1.99))
  dessertMenu.add(MenuItem.new(
    "Sorbet",
    "A scoop of raspberry and a scoop of lime",
    true,
    1.89))

  cafeMenu.add(MenuItem.new(
    "Veggie Burger and Air Fries",
    "Veggie burger on a whole wheat bun, lettuce, tomato, and fries",
    true,
    3.99))
  cafeMenu.add(MenuItem.new(
    "Soup of the day",
    "A cup of the soup of the day, with a side salad",
    false,
    3.69))
  cafeMenu.add(MenuItem.new(
    "Burrito",
    "A large burrito, with whole pinto beans, salsa, guacamole",
    true,
    4.29))

  cafeMenu.add(coffeeMenu)

  coffeeMenu.add(MenuItem.new(
    "Coffee Cake",
    "Crumbly cake topped with cinnamon and walnuts",
    true,
    1.59))
  coffeeMenu.add(MenuItem.new(
    "Bagel",
    "Flavors include sesame, poppyseed, cinnamon raisin, pumpkin",
    false,
    0.69))
  coffeeMenu.add(MenuItem.new(
    "Biscotti",
    "Three almond or hazelnut biscotti cookies",
    true,
    0.89))

  waitress = Waitress.new(allMenus)
  waitress.printMenu()
end

main

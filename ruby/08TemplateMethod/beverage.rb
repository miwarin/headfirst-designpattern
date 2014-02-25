#!/usr/bin/ruby -Ks

class CaffeineBeverage
  def prepareRecipe
    boilWater
    brew
    pourInCup
    addCondiments
  end
  
  def brew
  end
  
  def addCondiments
  end
  
  def boilWater
    puts "お湯を沸かします"
  end
  
  def pourInCup
    puts "カップに注ぎます"
  end
end

class Tea < CaffeineBeverage
  def brew
    puts "紅茶を浸します"
  end
  
  def addCondiments
    puts "レモンを追加します"
  end
end

class Coffee < CaffeineBeverage
  def brew
    puts "フィルタでコーヒーをドリップします"
  end
  
  def addCondiments
    puts "砂糖とミルクを追加します"
  end
end

def main
  tea = Tea.new
  coffee = Coffee.new
  
  puts "\n紅茶を作っています..."
  tea.prepareRecipe
  
  puts "\nコーヒーを作っています..."
  coffee.prepareRecipe
end

main


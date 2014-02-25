#!/usr/bin/ruby -Ks

class Menu
  include Enumerable
  
  def initialize( item )
    @item = item
  end
  
  def each
    @item.each do |menu|
      yield menu
    end
  end
end

def main
  menuItems = [ "K&Bのパンケーキ朝食", "通常のパンケーキ朝食", "ワッフル"]
  menu = Menu.new( menuItems )
  menu.each {|n|
    puts n
  }
end

main

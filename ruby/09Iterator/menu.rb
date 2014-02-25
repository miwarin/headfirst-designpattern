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
  menuItems = [ "K&B�̃p���P�[�L���H", "�ʏ�̃p���P�[�L���H", "���b�t��"]
  menu = Menu.new( menuItems )
  menu.each {|n|
    puts n
  }
end

main

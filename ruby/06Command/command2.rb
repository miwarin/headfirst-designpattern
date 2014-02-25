#!/usr/bin/ruby -Ks

module Command
  def execute
  end
end

class Command1
  include Command
  
  def execute
    puts "ねんがんの アイスソードをてにいれたぞ！"
  end
end

class Command2
  include Command
  
  def execute
    puts "殺してでも うばいとる"
  end
end

class Command3
  include Command
  
  def execute
    puts "な なにをする きさまらー！"
  end
end

class IceSword
  def initialize
    @slot = []
  end
  
  def add( command )
    @slot << command
  end
  
  def run
    @slot.each { |cmd| cmd.execute }
  end
end

def main
  ice = IceSword.new
  cmd1 = Command1.new
  cmd2 = Command2.new
  cmd3 = Command3.new
  ice.add( cmd1 )
  ice.add( cmd2 )
  ice.add( cmd3 )
  ice.run
end

main


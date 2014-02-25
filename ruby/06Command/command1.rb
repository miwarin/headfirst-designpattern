#!/usr/bin/ruby -Ks

class Light
  def on
    puts "親方さま！照明を点灯させます！"
  end
  
  def off
    puts "親方さま！照明を消灯させます！アッー"
  end
end

module Command
  def execute
  end
end

class LightOnCommand
  include Command
  
  def initialize( light )
    @light = light
  end
  
  def execute
    @light.on
  end
end

class SimpleRemoteControl
  def initialize
  end
  
  def setCommand( command )
    @slot = command
  end
  
  def buttonWasPressed
    @slot.execute
  end
end

def main
  remote = SimpleRemoteControl.new
  light = Light.new
  lightOn = LightOnCommand.new( light )
  remote.setCommand( lightOn )
  remote.buttonWasPressed
end

main


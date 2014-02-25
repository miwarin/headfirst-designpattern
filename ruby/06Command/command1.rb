#!/usr/bin/ruby -Ks

class Light
  def on
    puts "�e�����܁I�Ɩ���_�������܂��I"
  end
  
  def off
    puts "�e�����܁I�Ɩ������������܂��I�A�b�["
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


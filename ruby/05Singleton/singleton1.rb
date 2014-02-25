#!/usr/bin/ruby -Ks

class Singleton
  @@singleton = nil
  
  private_class_method :new
  def Singleton.getInstance
    @@singleton = new if @@singleton == nil
    return @@singleton
  end
end

def main
  obj1 = Singleton.getInstance
  obj2 = Singleton.getInstance
  puts "“¯‚¶" if obj1 == obj2
end

main

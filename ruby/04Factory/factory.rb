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
    when "�`�[�Y"
      NYStyleCheesePizza.new
##    when "���"
##      NYStyleVeggiePizza.new
##    when "�N����"
##      NYStyleClamPizza.new
##    when "�y�p���j"
##      NYStylePepperoniPizza.new
    else
      nil
    end
  end
end

class ChicagoPizzaStore < PizzaStore
  def createPizza( item )
    case item
    when "�`�[�Y"
      ChicagoStyleCheesePizza.new
##    when "���"
##      ChicagoStyleVeggiePizza.new
##    when "�N����"
##      ChicagoStyleClamPizza.new
##    when "�y�p���j"
##      ChicagoStylePepperoniPizza.new
    else
      nil
    end
  end
end

class CaliforniaPizzaStore < PizzaStore
  def createPizza( item )
    case item
    when "�`�[�Y"
      CaliforniaStyleCheesePizza.new
    when "���"
      CaliforniaStyleVeggiePizza.new
    when "�N����"
      CaliforniaStyleClamPizza.new
    when "�y�p���j"
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
    puts "#{@name}��������"
    puts "���n�����˂�..."
    puts "�\�[�X��ǉ�..."
    puts "�g�b�s���O��ǉ�:"
    @toppings.each {|t|
      puts " #{t}"
    }
  end
  
  def bake
    puts "350�x��25���ԏĂ�"
  end
  
  def cut
    puts "�s�U���`�ɐ؂蕪����"
  end
  
  def box
    puts "PizzaStore �̐����Ȕ��Ƀs�U������"
  end
  
  def getName
    @name
  end
end

class NYStyleCheesePizza < Pizza
  def initialize
    @name = "�j���[���[�N�X�^�C���̃\�[�X&�`�[�Y�s�U"
    @dough = "�����N���X�g���n"
    @sauce = "�}���i���\�[�X"
    @toppings = []
    @toppings << "�����b�W���[�m�`�[�Y"
  end
end

class ChicagoStyleCheesePizza < Pizza
  def initialize
    @name = "�V�J�S�X�^�C���̃f�B�[�v�f�B�b�V���`�[�Y�s�U"
    @dough = "�Ɍ��N���X�g���n"
    @sauce = "�v�����g�}�g�\�[�X"
    @toppings = []
    @toppings << "���񂾃��b�c�@�����`�[�Y"
  end
  
  def cut
    puts "�s�U���l�p�`�ɐ؂蕪����"
  end
end

def main
  nyStore = NYPizzaStore.new
  chicagoStore = ChicagoPizzaStore.new
  pizza = nyStore.orderPizza( "�`�[�Y" )
  puts "�C�[�T���̒�����#{pizza.getName}"
  pizza = chicagoStore.orderPizza( "�`�[�Y" )
  puts "�W���G���̒�����#{pizza.getName}"
end

main


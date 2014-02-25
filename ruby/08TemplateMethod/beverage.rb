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
    puts "�����𕦂����܂�"
  end
  
  def pourInCup
    puts "�J�b�v�ɒ����܂�"
  end
end

class Tea < CaffeineBeverage
  def brew
    puts "�g����Z���܂�"
  end
  
  def addCondiments
    puts "��������ǉ����܂�"
  end
end

class Coffee < CaffeineBeverage
  def brew
    puts "�t�B���^�ŃR�[�q�[���h���b�v���܂�"
  end
  
  def addCondiments
    puts "�����ƃ~���N��ǉ����܂�"
  end
end

def main
  tea = Tea.new
  coffee = Coffee.new
  
  puts "\n�g��������Ă��܂�..."
  tea.prepareRecipe
  
  puts "\n�R�[�q�[������Ă��܂�..."
  coffee.prepareRecipe
end

main


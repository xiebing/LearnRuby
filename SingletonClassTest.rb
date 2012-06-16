require 'singleton'

class SingletonClassTest
  attr_accessor :data
  include Singleton
end

a = SingletonClassTest.instance
b = SingletonClassTest.instance

p a
p b

a.data = 8 
puts b.data

puts "Top Level"
puts "self is #{self}"

class C
  puts "Class definition block:"
  puts "self is #{self}"
  module M 
    puts "Nested module C::M:"
    puts self
  end
  def self.x
    puts "Class method C.x:"
    puts "self is #{self}"
  end

  def m
    puts "Instance method C#x:"
    puts "self is #{self}"
  end
end
C.x
C::x
#C.m
#C::m
c = C.new
c.m


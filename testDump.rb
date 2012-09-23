require 'yaml'

class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
    @area = length * width
  end
  def to_yaml_properties
    %w{ @length @width }
  end
  def to_s
    "#@length #@width #@area"
  end
end

obj = Rectangle.new(10, 20)
puts obj.to_yaml
puts "Before: obj = #{obj}"

#data = Marshal.dump(obj)
#obj = Marshal.load(data)
data = YAML.dump(obj)
puts data
obj = YAML.load(data)

puts "After: ojb = #{obj}"
puts obj.inspect

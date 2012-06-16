require_relative 'class_C'
class D < C

end
puts "start:"
obj = D.new
obj.report

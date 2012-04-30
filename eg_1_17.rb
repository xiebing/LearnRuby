#!/usr/bin/ruby
def odd?(n)
  case n % 2
    when 0 then false
    when 1 then true
  end
end

while num = gets
  unless /\A-?\d+Z/ =~ num
    $stderr.puts "please input integer:"
  end
  num = num.to_i
  if odd?(num)
    puts "#{num} is jishu"
  else
    puts "#{num} is oushu"
  end
end

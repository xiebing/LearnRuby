class MyNewException < Exception

end

begin
  puts "About to raise exception ..."
  raise MyNewException, "this is my own new exception"
rescue MyNewException => e
  puts "Just raised an exception: #{e}"
  raise e
end

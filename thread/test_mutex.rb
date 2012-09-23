require "thread"

semaphore = Mutex.new
n = 0
Thread.new {puts "hello"}

a = Thread.new do
  #semaphore.synchronize do
     #sleep 2
     puts "from a"
  #end
end

b = Thread.new do
  #semaphore.synchronize do
     puts "from b"
  #end
end

a.join
b.join


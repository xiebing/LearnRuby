require 'stringio'
buffer = String.new
sio = StringIO.new(buffer)
$stderr = $stdout = sio
puts "untuh"
warn "outed"
$stdout = STDOUT
$stderr = STDERR

puts buffer

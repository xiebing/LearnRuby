hash_symble = {:hello => "world", :hi => "Shanghai", :good => "morning"}

hash_string = {"hello" => "world", "hi" => "Shanghai", "good" => "morning"}

start = Time.now
10000.times do
  hash_symble[:hello] + hash_symble[:hi] + hash_symble[:good]
end

end_time = Time.now

puts "time cost: #{end_time - start}"

start = Time.now
10000.times do
  hash_string["hello"] + hash_string["hi"] + hash_string["good"]
end

end_time = Time.now

puts "time cost: #{end_time -start}"

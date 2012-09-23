require 'yajl'

p "hello"

hash = Yajl::Parser.parse('{"a" : "a % b"}')

p hash["a"]

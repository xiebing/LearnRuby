require 'yaml'
a = {:a1 => "1 % 1", "a2" => 2}
b = {:b1 => 3, :b2 => 4}
c = [1, 2, 3]
d = {:meta => [{:label=>'x',:type=>'Date'},{:label=>'charge',:type=>'Number'},{:label=>'title',:type=>'String'}]}
configuration ={ :aa => a, :bb => b, :cc => c, :dd => d }

open('text.yml', 'w'){ |f| YAML.dump(configuration, f )}
open('text.yml') { |f| puts f.read }
open('text.yml') do |f|
  obj = YAML.load(f)
  puts obj[:aa][:a1]
  puts obj[:bb][:b2]
end

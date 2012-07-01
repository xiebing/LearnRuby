#!/usr/bin/env ruby

require 'time'
require 'optparse'
require 'fileutils'

#-s -e -t
#-h -v
@from_time = Time.parse("00:00:00")
@to_time = Time.parse("23:59:59")
mark_tpm = 0
datas_dir = '.'

opts = OptionParser.new do |opts|
  opts.banner = "Usage: perf-ana.rb [options]\n For example: -s 16:20:00 -e 16:30:00 -t 30 -d /home/xiebing/data"
  
  opts.separator ""
  opts.separator "Specific options:"

  opts.on("-s", "--start START_TIME", "Specify the earliest time") do |start_time|
    @from_time = Time.parse(start_time)
  end
  
  opts.on("-e", "--end END_TIME", "Specify the latest time") do |end_time|
    @to_time = Time.parse(end_time)
  end

  opts.on("-t", "--tpm TPM", "Specify marked tpm, output >=tpm data and lines") do |tpm|
    mark_tpm = tpm.to_i
  end
  
  opts.on("-d", "--dir DIR", "Specify the data files dir") do |dir|
    datas_dir = dir
  end
  
  opts.separator ""
  opts.separator "Common options:"

  opts.on_tail("-h", "--help", "Show helps") do
    puts opts
    exit
  end

  opts.on_tail("-v", "--version", "Show version") do
    puts '1.0'
    exit
  end
end

args = ARGV.dup
opts.parse!(args)

@results = {}
def between?(time)
  time = Time.parse(time)
  
  if time >= @from_time && time <= @to_time
    return true
  end
end

def make_hash(time, tpm, rtime)
  if between?(time)
    if @results.has_key?(time)
      @results[time][:tpm] += tpm
      @results[time][:rtime] = (@results[time][:rtime] + rtime) / 2
    elsif
      @results[time] = {:tpm => tpm, :rtime => rtime}
    end
  end
end

def parse_file(file)
  File.open(file,'r') do |file|
    file.each_line do |line|
      datas = line.split
      make_hash("#{datas[0]} #{datas[1]}", datas[3].to_i, datas[5].to_i)
    end
  end
end

Dir.glob(File.join(datas_dir, '*.new')).each{ |file|
  parse_file(file)
}
time_sorted_results = @results.sort_by {|key, value| Time.parse(key)}
tpm_sorted_results = @results.sort {|one, two| two[1][:tpm]<=>one[1][:tpm]}

def write_output(results, filename)
  FileUtils.rm filename, :force => true
  file = File.new(filename, 'w')
  results.each do |key, value|
    file.write("#{key}  #{value[:tpm]}  #{value[:rtime]}\n")
  end
  file.close
end

# out put combined file
write_output(time_sorted_results, File.join(datas_dir, "combined_results.txt"))
# out put the file order by tpm and filter by time
write_output(tpm_sorted_results, File.join(datas_dir, "tpm_sorted_results.txt"))
# out put
max = 0
max_time = ""
total_tpm = 0
total_rtime = 0
larger_count = 0
@results.each do |key, value|
  total_tpm += value[:tpm]
  total_rtime += value[:rtime]
  
  if value[:tpm] > max
    max = value[:tpm]
    max_time = key
  end
  
  if value[:tpm] > mark_tpm
    larger_count += 1
  end
end

avg_tpm = total_tpm / @results.size
avg_rtime = total_rtime / @results.size

start = time_sorted_results[0][0]

def duration(start, max_time)
  start = Time.parse(start)
  max_time = Time.parse(max_time)
  duration = (max_time - start).to_i 
  hour = duration / 3600
  mins = (duration - 3600 * hour)/60
  secs = duration - 3600 * hour - mins * 60
  "#{hour}:#{mins}:#{secs}"
end

puts "max: #{max_time}    tpm: #{@results[max_time][:tpm]}    rtime: #{@results[max_time][:rtime]}    max tpm reached after: #{duration(start, max_time)}"
puts "avg_tpm: #{avg_tpm}   avg_rtime: #{avg_rtime}"
puts "start time: #{start}"
puts "greater than specific tpm count: #{larger_count}" if mark_tpm.to_i > 0


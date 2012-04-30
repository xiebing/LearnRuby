#!/usr/bin/env ruby
class Duration
  @@class_variable = "foo"
  p @@class_variable
  def initialize(since, till)
    puts "initialize"
    @since = since
    @until = till
  end
  attr_accessor "since", :until
  def display(target=$>)
    super
    target.write "(#{self.since} - #{self.until})"
  end
  
  def self.a_week_from(from)
    return self.new(from, from+7*24*60*60)
  end
  
  private
  def internal_use
  end
  def public_api
    return internal_use
  end
  public :public_api
end

duration = Duration.new(Time.now, Time.now + 3600)
p duration.until
p duration.since = Time.now

duration.display

duration.public_api

p Duration.a_week_from(Time.now)

p Duration.class

#p duration.a_week_from(Time.now) # ndefined method `a_week_from' for #<Duration:0x10f7a2370> (NoMethodError)
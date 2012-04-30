#!/usr/bin/env ruby
CENTRAL_REPOSITORY = Object.new

def CENTRAL_REPOSITORY.register(target)
  @registered_objects ||= []
  unless @registered_objects.include? target
    @registered_objects << target
  end
  
  def CENTRAL_REPOSITORY.unregister(target)
    @registered_objects ||= []
    @registered_objects.delete(target)
  end
end

p CENTRAL_REPOSITORY.class

CENTRAL_REPOSITORY.register("abc")

p CENTRAL_REPOSITORY.unregister("abc")

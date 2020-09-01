#!/usr/bin/env ruby

puts 'Use Hooks to Keep Your Program Informed'

class SimpleBaseClass
  def self.inherited( new_subclass )
    puts "Hey #{new_subclass} is now a sublcass of #{self}!"
  end
end

class ChildClassOne < SimpleBaseClass
end


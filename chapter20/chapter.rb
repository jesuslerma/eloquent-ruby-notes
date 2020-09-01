#!/usr/bin/env ruby
require './document_reader.rb'
require './plain_text_reader.rb'

puts 'Use Hooks to Keep Your Program Informed'

class SimpleBaseClass
  def self.inherited( new_subclass )
    puts "Hey #{new_subclass} is now a sublcass of #{self}!"
  end
end

class ChildClassOne < SimpleBaseClass
end

puts 'The beauty of doing it this way is that the programmer does not need to maintain the list by hand'
puts DocumentReader.reader_classes

proc_object = proc do |event, file, line, id, binding, klass|
  puts "#{event} in #{file}/#{line} #{id} #{klass}"
end

set_trace_func(proc_object)

require 'date'

at_exit do
  puts 'Chapter end'
end

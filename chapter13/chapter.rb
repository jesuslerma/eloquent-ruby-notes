#!/usr/bin/env ruby
require './document.rb'

puts 'Get the Behavior You Need with Singleton and Class Methods'

puts <<EOF
In Ruby a singleto method is a method thar is defined for exactly
one object instance.
EOF

hand_build_stub_printer = Object.new

class << hand_build_stub_printer
  def available?
    true
  end

  def render
    nil
  end
end


my_object = Document.new('War and Peace', 'Tolstoy', 'All happy families...')

def my_object.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"
end

my_object.explain

puts <<EOF
Once you get used to the idea that a class method is just a singleton method on 
an instance of Class, a lot of things that you learned in Ruby 101 start to 
make sense
EOF

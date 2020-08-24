#!/usr/bin/env ruby
require './document.rb'
puts 'Use blocks to iterate'

def do_something
  yield('Hello World') if block_given?
end

do_something do |message|
  puts "The message is #{message}"
end


d = Document.new( 'Truth', 'Gump', 'Life is like a box of ...' )
d.each_word {|word| puts word}


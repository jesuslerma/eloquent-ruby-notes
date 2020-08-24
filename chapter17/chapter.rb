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
puts d.each {|word| puts word}.include? 'Life'

12.times { |x| puts "The number is #{x}" }

doc = Document.new( 'Donuts', '?', 'I love donuts mmm donuts' )
doc.each_word_pair {|first, second| puts "#{first} #{second}" }


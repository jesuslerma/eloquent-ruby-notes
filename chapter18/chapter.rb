#!/usr/bin/env ruby
require './document.rb'
puts 'Execute Around with a Block'

doc = Document.new( 'Constitucion Mexicana', 'IDK', '') do |d|
  d.content << 'Esta es'
  d.content << 'La'
  d.content << 'Constitucion'
end

puts doc.content

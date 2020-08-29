#!/usr/bin/env ruby
require './document.rb'
require './block_based_archival_document.rb'
puts 'Save blocks to execute later'

def run_that_block( &that_block )
  puts 'About to run that block'
  that_block.call if that_block
  puts 'Done running the block'
end

run_that_block do
  puts 'We are in the block'
end

my_doc = Document.new( 'Block Based Example', 'russ', '' )

my_doc.on_load do |doc|
  puts "Hey, I've been loaded!"
end

my_doc.on_save do |doc|
  puts "Hey, I've been saved!"
end

my_doc.load('example.txt')
my_doc.save('example.txt')

file_doc = BlockBasedArchivalDocument.new( 'file', 'russ') do
  File.read('some_text.txt')
end

puts file_doc.content

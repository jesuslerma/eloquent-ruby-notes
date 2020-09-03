#!/usr/bin/env ruby
require './document.rb'

puts 'Use method_missing for Flexible Error Handling'

doc = Document.new('Titanic', 'Cameron', 'Sail, crash, sink')
puts "The text is #{doc.contnt}"

# this is a class sample to handle method missing

class RepeatBackToMe
  def method_missing( method_name, *args )
    puts "Method: #{method_name}"
    puts "Args: #{args.join(',')}"
   end
end

repeat = RepeatBackToMe.new
repeat.hello(1,2,4)
repeat.good_bye(1,2,2)

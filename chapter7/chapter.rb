#!/usr/bin/env ruby
puts 'Everything is an Object'

class Document
  attr_reader :title
  def initialize( a,b, c)
    @title = a
    @content = c
  end
  def words
    @content.split
  end
  
  def word_count
    words.size
  end

  def about_me
    puts "I am #{self}"
    puts "My title is #{self.title}"
    # you can use self.word_count
    # but dont write it whn a plain
    # word_count will do the same.
    puts "I have #{word_count} words"
  end
end

puts 'Ruby classes act as containers of methods'
puts 'Classes are also factories, factories for making instances'

doc = Document.new('Ethics', 'Spinoza', 'By that etc')
doc.about_me

puts <<EOF
The importance of being an object
Instance of Object also inherit some interesting methods.
The evsl method defined by Object takes an
string and execute the string as if it were ruby code
EOF

#while true
#  print "Cmd>"
#  cmd = gets
#  puts (eval(cmd))
#end

sum_sample = "1 + 1"
puts sum_sample
puts( eval ( sum_sample ) )

puts <<EOF
There are also reflection-oriented methods: methods that let
you dig into the internals of an object
EOF

pp doc.instance_variables

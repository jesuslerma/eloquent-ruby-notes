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
  
  def private_word_count
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

  # this is another way declaring private methods
  private :private_word_count
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


puts <<EOF
There are two important things about private and protected
Both are not used so frequently. And the second thig is
that you can still call private and protected methods by
calling send method
EOF

private_sample = "puts(doc.send( :private_word_count ))"
puts private_sample
eval( private_sample )


puts <<EOF
In Ruby, methods and method calls are the fundamental instrastructure
of the language. In the lowest layer of the basic infrastructure
of Ruby, a surprising number of things to be part of the language
are just calls to methods: private, require, attr_accessor, etc
are samples of importat parts of the language that are just call
to methods.
EOF

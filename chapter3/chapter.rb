#!/usr/bin/env ruby
# notes on collections
# Ruby programmers actually prefer to work with generic collections.
# To the Ruby way of thinking, one less class is one less thing
# to go wrong. When the problem is complexity, the cure might just be simplicity.

# a nice way to create strings
poem_words = %w{ twinkle little star how I wonder }
pp poem_words

class Document
  attr_accessor :author
  def initialize
    @author ||= ''
  end

  def add_authors( *names )
    @author += " #{names.join(' ')}"
  end
end

document = Document.new
document.add_authors( 'Chuy Lerma', 'Lee Calcote', 'Dennis Ritchie' )
pp document.author

words = %w{ Mary had a little lamb }

words.each { |word| puts word }

movie = { title: '2001', genre: 'sci fi', rating: 10 }
movie.each {|entry| pp entry }
movie.each { |name, value| puts "#{name} => #{value}" }

# a simple avg operation build with inject
def avg_word_length( words )
  total = words.inject(0.0) { |result, word| word.size + result }
  total / words.size
end
avg = avg_word_length words
pp avg


# this is a common error
array = []
pp array.length
array[24601] = "Jean Valjean"
pp array.length

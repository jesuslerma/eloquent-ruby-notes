#!/usr/bin/env ruby
require './document.rb'

puts 'Update Existing Classes with Monkey Patching'
cover_letter = Document.new('Letter', 'Chuy', "Here's my resume")

puts cover_letter.average_word_length

empty_doc = Document.new( 'Empty!', 'No Author', '' )
puts empty_doc.average_word_length

puts 'We need to do some Monkey Patching of Document class'

class Document
  def average_word_length
    return 0.0 if word_count == 0
    len = words.inject(0.0){ |total, word| word.size + total }
    len / words.size
  end
end

empty_doc = Document.new( 'Empty!', 'No Author', '' )
puts empty_doc.average_word_length

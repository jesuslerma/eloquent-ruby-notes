#!/usr/bin/env ruby
# Idiomatic control structures.

class Document
  attr_accessor :writable, :readonly
  attr_reader :title, :author, :content
  # this is the usual way to do validations
  # this if is not Idiomatic
  def title=( new_title )
    if not @read_only
      @title = new_title
    end
  end
  # This is a more idiomatic way of doing the same thing
  def title=( new_title )
    unless @read_only
      @title = new_title
    end
  end

  def title=( new_title )
    @title = new_title unless @read_only
  end
end

document = Document.new
document.title = "SomeSample"
puts document.title

# also there is the same reason of why we should use until instead of while with negative conditions
# for example use this until document.printed? instead of while ! document.is_printed?

# This is the idiomatic way of doing for

fonts = ['courier', 'times roman', 'helvetica']

fonts.each do |font|
  puts font
end

# the idiomatic way of doing case statements is
author = case document.title
         when 'SomeSample' then 'Chuy Lerma'
         when 'Another title' then 'Another Author'
         else 'I dont know'
         end
puts author
# some ruby programmers prefer doing this way
author = if document.title == 'SomeSample'
           'Chuy Lerma'
         elsif document.title == 'Another title'
           'Another Author'
         else
           'I dont know'
         end
puts author

# be careful when expecting some value to be true. Since almost everything is true and only false and nil are treated as false. For example.

doc = Document.new
flag = defined?( doc )

puts flag # this will return 'local-variable

# so if you want to know if a variable is not defined you can use this

unless defined?( mynae )
  puts "myname is not defined"
end

# but you should never use
if flag
  puts "Flag is defined but it is not true, it only contains a value"
end

# for the same reason you should evaluate nil
# until (next_objet = get_next_object).nil?

first_name = 'jesus' unless first_name
puts first_name

second_name ||= 'ian'
puts second_name

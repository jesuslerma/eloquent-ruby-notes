#!/usr/bin/env ruby
puts 'Embrace Dynamic Typing!'

puts <<EOF
This simple sentece "every declaration you leave out
is one bit less code" is just the down payment on
code you save with dynamic typing. Much more significant
savings comes from the classes, modules, and methods
that you never write at all/
EOF

puts <<EOF
Instead of looking at an object's type to decide whether it is
the correct object, Ruby simply assumes that if an object has the
right methods, then it is the right kind of object. This philosophy
is sometimes called duck typing.
EOF

puts <<EOF
Lets take a look at the Document and Lazy document samples.
EOF

class BaseDocument
  def title
    raise "Not Implemented"
  end

  def title=
    raise "Not Implemented"
  end

  def author
    raise "Not Implemented"
  end

  def author=
    raise "Not Implemented"
  end

  def content
    raise "Not Implemented"
  end
end 

class Document < BaseDocument
  attr_accessor :title, :author, :content

  def initialize( title, author, content )
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

class LazyDocument < BaseDocument
  attr_writer :title, :author, :content

  def initialize( path )
    @path = path
    @document_read = false
  end

  def read_document
    return if @document_read
    File.open( @path ) do | f |
      @title = f.readline.chomp
      @author = f.readline.chomp
      @content = f.read
    end
    @document_read = true
  end

  def title
    read_document
    @title
  end
  
  def title=( new_title )
    read_document
    @title = new_title
  end
end


puts <<EOF
In this case we're using an abstract class to do some sort
of inheritance with Document and Lazy Document.
Anyway this is not a good Ruby coding. The problem is that
BaseDocument does nothing and takes more than 30 lines to
do nothing.

The reason for that is a bad Ruby coding is because instead
of looking at an object's type to decide whether it is the
correct object, Ruby simply assums that if an object has
the right methods, then it is the right kind of object. This
is sometimes called DUCK TYPING.
EOF


class Document 
  attr_accessor :title, :author, :content

  def initialize( title, author, content )
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

class LazyDocument 
  attr_writer :title, :author, :content

  def initialize( path )
    @path = path
    @document_read = false
  end

  def read_document
    return if @document_read
    File.open( @path ) do | f |
      @title = f.readline.chomp
      @author = f.readline.chomp
      @content = f.read
    end
    @document_read = true
  end

  def title
    read_document
    @title
  end
  
  def title=( new_title )
    read_document
    @title = new_title
  end
end


puts <<EOF
By removing the inheritance from BaseDocument any code
that used the old related versions of Document and LazyDocument will
still work with the new unrelated classes. After all, both
classes support the same set of  methods.
EOF


class Title
  attr_reader :long_name, :short_name
  attr_reader :isbn

  def initialize(long_name, short_name, isbn)
    @long_name = long_name
    @short_name = short_name
    @isbn = isbn
  end
end

class Author
  attr_reader :first_name, :last_name

  def initialize( first_name, last_name ) 
    @first_name = first_name
    @last_name = last_name
  end
end

puts <<EOF
Imagine that you need to expect title and author params from
Document class to be an instance of Title and Author, instead of
strings. So you need to do NOTHING in Document in order to
receive those new values
EOF

two_cities = Title.new( 'A Tale of Two Cities', '2 Cities',
                        '0-999-9999-9' )
dicknes = Author.new( 'Charles', 'Dicknes' )
doc = Document.new( two_cities, dicknes, 'It was the best..' )

puts <<EOF
As a note: Never Use some sort of type validation. Any type of pseudo-statyc
type checking combines all the disadvantages of the two camps.
EOF

puts <<EOF
The best way to avoid mixing your types, like metaphors, is to write the
clearest, most concise code youcan, which explains why Ruby programmers
place such a high premium on clear and consie code.

The Ruby answer to bugs (type-related and non-type-related) is to write
automated tests, lots and lots of automated tests.
EOF
EOF

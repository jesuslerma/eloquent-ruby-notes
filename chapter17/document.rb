require './finders.rb'

class Document 
  extend Finders
  attr_accessor :title, :author, :content

  def initialize( title, author, content )
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def each_word
    words.each { |word| yield(word) }
  end

  def each_word_pair
    word_array = words
    index = 0
    while index < (word_array.size-1)
      yield word_array[index], word_array[index+1]
      index += 1
    end
  end

  def word_count
    words.size
  end

  def prose_rating
    return :really_pretentious if really_pretentious?
    return :somewhat_pretentious if somewhat_pretentious?
    return :really_informal if really_informal?
    return :somewhat_informal if somewhat_informal?
  end

  def really_pretentious?
    pretentious_density > 0.3 && informal_density < 0.2
  end

  def somewhat_pretentious?
    pretentious_density > 0.3 && informal_density >= 0.2
  end

  def really_informal?
    pretentious_density < 0.1 && informal_density > 0.3
  end

  def somewhat_informal?
    pretentious_density < 0.1 && informal_density <= 0.3
  end

  def pretentious_density
    # fake this method
    0.4
  end

  def informal_density
    # fake this method
    0.3
  end

  def +(other)
    Document.new( title, author, "#{content} #{other.content}" )
  end

  def !
    Document.new( title, author, "It is not true: #{content}" )
  end

  def [](index)
    words[index]
  end

  def size()
    words.size
  end
end


require 'text'
ENCRYPTION_ENABLED = true
class Document
  include Enumerable
  include Text

  DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "Loaded: #{path}"
  end

  DEFAULT_SAVE_LISTENER = lambda do |doc, path|
    puts "Saved: #{path}"
  end

  attr_accessor :title, :author, :content
  attr_accessor :load_listener
  attr_accessor :save_listener

  def initialize( title, author, content = '')
    @title = title
    @author = author
    @content = content
    @save_listener = DEFAULT_SAVE_LISTENER
    @load_listener = DEFAULT_LOAD_LISTENER
    yield( self ) if block_given?
  end
  # TODO
  def self.load
  end

  def self.reload
    load( __FILE__)
  end

  # This code is an real sample of self-modifying classes
  if RUBY_VERSION >= '1.9'
    def char_at( index )
      @content[ index ]
    end
  else
    def char_at( index )
      @content[ index ].chr
    end
  end

  def average_word_length
    len = words.inject(0.0){ |total, word| word.size + total }
    len / words.size
  end

  def self.const_missing( const_name )
    msg = %Q{
      You tried to call the constant #{const_name}
      There is not such constant in this class
    }
    raise msg
  end

  def method_missing( missing, *args )
    candidates = methods_that_sounds_like( missing.to_s )
    message = "You called an undefined method: #{missing}"
    unless candidates.empty?
      message += "\nDid you mean #{candidates.join(' or ')}?"
    end
    raise NoMethodError.new( message )
  end

  def methods_that_sounds_like( name )
    missing_soundex = Soundex.soundex( name.to_s )
    public_methods.sort.find_all do |existing|
      existing_soundex = Soundex.soundex( existing.to_s )
      missing_soundex == existing_soundex
    end
  end

  def load( path )
    @content = File.read( path )
    @load_listener.call( self, path ) if @load_listener
  end

  def save( path )
    File.open( path, 'w' ) do |f|
      f.puts( encrypt( @title ) )
      f.puts( encrypt( @author ) )
      f.puts( encrypt( @content ) )
    end
    @save_listener.call( self, path ) if @save_listener
  end

  def self.enable_encryption( enabled )
    if enabled
      def encrypt( string )
        string.tr( 'a-zA-Z', 'm-za-1M-ZA-L')
      end
    else
      def encrypt( string )
        string
      end
    end
  end

  enable_encryption( ENCRYPTION_ENABLED )
  def on_save( &block )
    @save_listener = block
  end

  def on_load( &block )
    @load_listener = block
  end

  def words
    @content.split
  end

  def each
    words.each { |word| yield(word) }
  end

  def each_word_pair
    words.each_cons(2) {|array| yield array[0], array[1]}
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


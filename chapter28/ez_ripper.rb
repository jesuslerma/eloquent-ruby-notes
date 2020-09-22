class EzRipper
  def initialize( program_path )
    @ripper = XmlRipper.new
    parse_program(program_path)
  end

  def run( xml_file )
    @ripper.run( xml_file )
  end

  def parse_program( program_path )
    File.open( program_path ) do |f|
      until f.eof?
        parse_statement( f.readline )
      end
    end
  end

  def parse_statement( statement )
    # replace comments
    statement = statement.sub(/#.*/, '')
    case statement.strip
    when ''
    when /print\s+'(.*?)'/
      @ripper.on_path( $1 ) do |el|
        puts el.text
      end
    when /delete\s+'s(.*?)'/
      @ripper.on_path( $1 ) { |el| el.remove }
    when /replace\s+'s(.*?)'\s+'(.*?)'$/
      @ripper.on_path( $1 ) { |el| el.text = tokens[2] }
    when 'print_document'
      @ripper.after do |doc|
        puts doc
      end
    else
      rase "Unknown keyword: #{tokens.first}"
    end
  end
end

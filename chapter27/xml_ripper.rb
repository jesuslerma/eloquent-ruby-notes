require 'rexml/document'

class XmlRipper
  def initialize(&block)
    @before_action = proc {}
    @path_actions = {}
    @after_action = proc {}
    instance_eval( &block) if block
  end

  def initialize_from_file( path )
    instance_eval( File.read( path ) )
  end

  def on_path( path, &block )
    @path_actions[path] = block
  end

  def before( &block )
    @before_action = block
  end

  def after( &block )
    @after_action = block
  end

  def method_missing( name, *args, &block )
    return super unless name.to_s =~ /on_.*/
    parts = name.to_s.split( '_' )
    parts.shift
    xpath = parts.join( '/' )
    on_path( xpath, &block )
  end

  def run( xml_file_path )
    File.open( xml_file_path ) do |f|
      document = REXML::Document.new(f)
      @before_action.call( document )
      run_path_actions( document )
      @after_action.call( document )
    end
  end 

  def run_path_actions( document )
    @path_actions.each do |path, block|
      REXML::XPath.each(document, path) do |element|
        block.call( element )
      end
    end
  end
end


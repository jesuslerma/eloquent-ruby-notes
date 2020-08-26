require './document.rb'

class SomeApplication
  def do_something
    with_logging('load') { @doc = Document.load( 'readme.txt' ) }
    # Do Something with the document
    with_logging('save') { @doc.save }
  end
  # This technique of "burry the details in a method that takes a block"
  # is called execute around.
  def with_logging(description)
    begin
      @logger.debug( "Starting #{description}" )
      return_value = yield
      @logger.debug( "Completed #{description}" )
      return_value
    rescue
      @logger.error( "#{description} failed!!" )
      raise
    end
  end
end

class Resume < StructuredDocument
  def name( text )
    paragraph = Paragraph.new( :nimbus, 14, :bold, text )
    self << paragraph
  end

  def address( text )
    paragraph = Paragraph.new( :nimbus, 12, :italic, text )
    self << paragraph
  end

  def email( text )
    paragraph = Paragraph.new( :nimbus, 12, :none, text )
    self << paragraph
  end
end

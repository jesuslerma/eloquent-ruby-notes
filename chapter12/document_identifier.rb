class DocumentIdentifier
  attr_reader :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name = name
  end

  def ==(other)
    return false unless other.instance_of?(self.class)

    folder == other.folder && name == other.name
  end
end

class VersionedIdentifier < DocumentIdentifier
  attr_reader :version

  def initialize( folder, name, version )
    super( folder, name )
    @version = version
  end

  def ==(other)
    return false unless other.instance_of? VersionedIdentifier
    return other.folder == folder &&
      other.name == name &&
      other.version == version
  end
  # we are creating this method because == is not transitive
  def is_same_document?(other)
      other.folder == folder && other.name == name
  end
end

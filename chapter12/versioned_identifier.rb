class VersionedIdentifier < DocumentIdentifier
  attr_reader :version

  def initialize( folder, name, version )
    super( folder, name )
    @version = version
  end

  def ==(other)
    if other.instance_of? VersionedIdentifier
      other.folder == folder &&
      other.name == name &&
      other.version == version
    elsif other.instance_of? DocumentIdentifier
      other.folder == folder && other.name == name
    end
  end
end

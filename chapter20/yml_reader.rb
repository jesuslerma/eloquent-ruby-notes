class YAMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.yaml/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    # lots of code omitted
  end
end

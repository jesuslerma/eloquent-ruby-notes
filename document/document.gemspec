Gem::Specification.new do |s|
  s.name = "document"
  s.version = "1.0.1"
  s.authors = [ "Chuy Lerma" ]
  s.date = %q{2020-09-01}
  s.description = "Ducment - Simple Document from Eloquent Ruby Book"
  s.summary = s.description
  s.email = "sss@someemail.com"
  s.files = ['README', 'lib/document.rb', 'spec/document_spec.rb']
  s.homepage = 'http://codecrafters.mx'
  s.has_rdoc = true
  s.rubyforge_project = 'simple_document'
  s.add_dependency('text')
end

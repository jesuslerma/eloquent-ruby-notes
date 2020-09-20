#!/usr/bin/env ruby
require('./xml_ripper.rb')

puts 'Invent Internal DSL'

ripper = XmlRipper.new do |r|
  r.on_path( '/document/author' ) { |a| puts a.text }
  r.on_path( '/document/chapter/title' ) { |t| puts t.text }
end

ripper.run( 'fellowship.xml' )


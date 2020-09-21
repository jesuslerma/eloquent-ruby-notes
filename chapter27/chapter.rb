#!/usr/bin/env ruby
require('./xml_ripper.rb')

puts 'Invent Internal DSL'

ripper = XmlRipper.new do
  on_path( '/document/author' ) { |a| puts a.text }
  on_path( '/document/chapter/title' ) { |t| puts t.text }
end

ripper.run( 'fellowship.xml' )


mripper = XmlRipper.new do
  on_path( '/document/author/' ) do |author|
    author.text = 'J.R.R. Tolkien'
  end
  after { |doc| puts doc }
end

mripper.run( 'fellowship.xml' )


rile_ripper = XmlRipper.new
ripper.initialize_from_file( 'fix_author.ripper' )
ripper.run( 'fellowship.xml' )

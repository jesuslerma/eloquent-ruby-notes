#!/usr/bin/env ruby
require('./xml_ripper.rb')

puts 'Invent Internal DSL'

ripper = XmlRipper.new do |r|
  r.on_path( '/document/author' ) { |a| puts a.text }
  r.on_path( '/document/chapter/title' ) { |t| puts t.text }
end

ripper.run( 'fellowship.xml' )


mripper = XmlRipper.new do |r|
  r.on_path( '/document/author/' ) do |author|
    author.text = 'J.R.R. Tolkien'
  end
  r.after { |doc| puts doc }
end

mripper.run( 'fellowship.xml' )


#!/usr/bin/env ruby

require('./paragraph.rb')
require('./structured_document.rb')
require('./resume.rb')
require('./instructions.rb')
require('./bank_statement.rb')

puts 'Create classes that modify their subclasses'

chuy_cv = StructuredDocument.new('Resume', 'Ch') do |cv|
  cv << Paragraph.new( :nimbus, 14, :bold, 'Chuy Lerma')
  cv << Paragraph.new( :nimbus, 12, :none, 'My name is that')
end

chuy_cv = Resume.new('Chuy', 'resume') do |cv|
  cv.name('Chuy Lerma')
  cv.address('124 Cd Victoria')
  cv.email('chuy@lerma.com')
end

instructions = Instructions.new('Instrucciones', 'Instrucciones de Uso') do |ints|
  ints.introduction('Hola y bienvenido')
end

puts instructions.paragraphs.map{ |p| p.text }

statement = BankStatement.new( 'Bank Statement', 'Chuy' )
statement.bad_news("You're broke!")
puts statement.content

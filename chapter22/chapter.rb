#!/usr/bin/env ruby
require './document.rb'
require './super_secret_document.rb'

puts 'Use method_missing for Delegation'

def get_instructions
  return Document.new( 'Cien años de Soledad', 'Gabriel Garcia MArquez', 'Contenido de la familia buen dia')
end

original_instructions = get_instructions

instructions = SuperSecretDocument.new(original_instructions, 5)

string = 'Good morning, Mr Chuy'
super_secret = SuperSecretDocument.new(string, 5)
puts super_secret.length

sleep 6

puts super_secret.length


#!/usr/bin/env ruby
require './document.rb'
require './super_secret_document.rb'

puts 'Use method_missing for Delegation'

def get_instructions
  return Document.new( 'Cien años de Soledad', 'Gabriel Garcia MArquez', 'Contenido de la familia buen dia')
end

original_instructions = get_instructions

instructions = SuperSecretDocument.new(original_instructions, 5)

#!/usr/bin/env ruby

require './font.rb'
require './tons_o_toner.rb'
require './oceans_of_ink.rb'

puts 'Use modules as name spaces'

use_lase_printer = true

if use_lase_printer
  print_module = TonsOToner
else
  print_module = OceansOfInk
end

admin = print_module::Administration.new
admin.test

puts 'you gan dig into this gem https://github.com/rom-rb/rom'

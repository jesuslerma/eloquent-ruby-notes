#!/usr/bin/env ruby
require './document.rb'
require './form_letter.rb'

puts 'Use method missing to Build Flexible Apis'

offer_letter = FormLetter.new("Special Offer", "Acme Inc",
  %q{
    Dear GENDER LASTNAME
    Are you troubled byt the
    ...
    FIRSTNAME, we loook forward to hearing from you.
})

offer_letter.replace_firstname('Chuy')
offer_letter.replace_lastname('Lerma')
offer_letter.replace_gender('Mr.')

puts offer_letter.content

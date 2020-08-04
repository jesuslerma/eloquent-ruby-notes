#!/usr/bin/env ruby

require './text_compressor.rb'

describe TextCompressor do
  it 'should return non repited words' do
    text = 'This specification is the spec for a specification'
    compressor = TextCompressor.new( text )
    compressor.unique.length == 7
  end
end

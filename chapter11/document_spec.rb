#!/usr/bin/env ruby
require './document.rb'

describe Document do
  before :each do
    @text = 'A bunch of words'
    @doc = Document.new( 'test', 'nobody', @text )
  end
  it 'should hold on to the contents' do
    @doc.content.should == @text
  end

  it 'should know which words it has' do
    @doc.words.should include( 'A' )
    @doc.words.should include( 'bunch' )
    @doc.words.should include( 'of' )
    @doc.words.should include( 'words' )
  end

  it 'should know how many words it contains' do
    @doc.word_count.should == 4
  end

  it 'should add a Document' do
    doc2 = Document.new('Tag Line1', 'Kirk', 'of the star ship')
    total_document = @doc + doc2
    total_document.content.should == 'A bunch of words of the star ship'
  end

  it 'should negate the content of a Document' do
    total_document = !@doc
    total_document.content.should == 'It is not true: A bunch of words'
  end
end

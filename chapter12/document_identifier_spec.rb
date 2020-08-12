#!/usr/bin/env ruby
require './document_identifier.rb'

describe DocumentIdentifier do
  before :each do
    @doc_id = DocumentIdentifier.new('rock', 'grind')
  end
  it 'should return true when instances have equal values' do
    doc_id2 = DocumentIdentifier.new("rock", "grind")
    (@doc_id == doc_id2).should == true
  end

  it 'shpuld return false when are validating different instance class' do
    some_str = 'String'
    (@doc == some_str).should == false
  end
end

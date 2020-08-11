#!/usr/bin/env ruby
require './document_identifier.rb'

describe DocumentIdentifier do
  before :each do
  end
  it 'should hold on to the contents' do
    doc_id1 = DocumentIdentifier.new("rock", "grind")
    doc_id2 = DocumentIdentifier.new("rock", "grind")

    (doc_id1 == doc_id2).should == true
  end
end

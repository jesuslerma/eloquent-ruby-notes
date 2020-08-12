#!/usr/bin/env ruby
require './document_pointer.rb'
require './document_identifier.rb'

describe DocumentPointer do
  it 'shpuld return false when are validating different instance class' do
    @doc_pointer = DocumentPointer.new('secret/area51', 'phone list')
    @doc_identifier = DocumentIdentifier.new('secret/area51', 'phone list')
    (@doc_pointer == @doc_identifier).should == true
  end
end

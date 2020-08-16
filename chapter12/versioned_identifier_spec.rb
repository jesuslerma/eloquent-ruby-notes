#!/usr/bin/env ruby
require './document_identifier.rb'
require './versioned_identifier.rb'

# We're creating the situation where (a == b) and (b == c) but (a != c)
describe VersionedIdentifier do
  before :each do
    @versioned_one = VersionedIdentifier.new( 'specs', 'bf9k', 'v1' )
    @versioned_two = VersionedIdentifier.new( 'specs', 'bf9k', 'v2' )
    @unversioned = DocumentIdentifier.new( 'specs', 'bf9k' )
  end

  it 'should return true' do
    (@unversioned == @versioned_one).should == true
  end

  it 'should return true' do
    (@unversioned == @versioned_two).should == true
  end

  it 'should return true' do
    (@versioned_one == @versioned_two).should == false
  end
end

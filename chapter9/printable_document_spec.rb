#!/usr/bin/env ruby
require './printable_document.rb'

describe PrintableDocument do
  before :each do
    @text = 'A bunch of words'
    @doc = PrintableDocument.new( 'test', 'nobody', @text)
  end

  it 'should know how to print itself' do
    stub_printer = double()
    stub_printer.stub(:available?) { true }
    stub_printer.stub(:render) { nil }
    expect(@doc.print( stub_printer )).to eq 'Done'
  end

  it 'should return the proper string if printer is offline' do
    stub_printer = double()
    stub_printer.stub(:available?) { false }
    stub_printer.stub(:render) { nil }
    expect(@doc.print( stub_printer )).to eq'Printer unavailable'
  end

  it 'should know how to print itself' do
    mock_printer = instance_double('Printer')
    mock_printer.should_receive(:available?).and_return(true)
    mock_printer.should_receive(:render).exactly(3).times
    @doc.print( mock_printer ).should == 'Done'
  end
end

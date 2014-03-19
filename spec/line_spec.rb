require 'spec_helper'

describe Line do
  describe 'initialize' do
    it 'initializes an instance of line' do
      test_line = Line.new({'name' => 'Blue'})
      test_line.should be_an_instance_of Line
    end
  end

  describe 'all' do
    it 'starts off an empty array' do
      Line.all.should eq []
    end
  end

  describe 'save' do
    it 'saves an instance to the database' do
      test_line = Line.new({'name' => 'Blue'})
      test_line.save
      Line.all.should eq [test_line]
    end
  end

  describe '==' do
    it 'recognizes a matching name in the database' do
      line1 = Line.new({'name' => 'Green'})
      line2 = Line.new({'name' => 'Green'})
      line1.should eq line2
    end
  end
end

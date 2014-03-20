require 'spec_helper'

describe Stop do
  describe 'initalize' do
    it 'creates an instance of Stop' do
      test_stop = Stop.new({'station_id' => 4, 'line_id' => 5})
      test_stop.should be_an_instance_of Stop
    end
  end

   describe '.all' do
    it 'starts off as an empty array' do
      Stop.all.should eq []
    end
  end

  describe '#save' do
    it 'saves all inputs into the database' do
      test_stop = Stop.new({'station_id' => 4, 'line_id' => 5})
      test_stop.save
      Stop.all.should eq [test_stop]
    end
  end

  describe '==' do
    it 'recognizes a match name in the database' do
      stop1 = Stop.new({'station_id' => 4, 'line_id' => 5})
      stop2 = Stop.new({'station_id' => 4, 'line_id' => 5})
      stop1.should eq stop2
    end
  end

  describe 'delete' do
    it 'deletes an existing stop' do
      test_stop = Stop.new({'station_id' => 4, 'line_id' => 5})
      test_stop.save
      test_stop.delete
      Stop.all.should eq []
    end
  end
end


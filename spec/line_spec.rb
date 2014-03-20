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

  describe 'all_stations' do
    it 'list all stations for a particular line' do
      test_line = Line.new ({'name' => 'Green'})
      test_line.save
      test_station1 = Station.new({'name' => 'Submarine Hill'})
      test_station1.save
      test_station2 = Station.new({'name' => 'Happy Hill'})
      test_station2.save

      test_stop1 = Stop.new({'station_id' =>"#{test_station1.id}",'line_id' => "#{test_line.id}"})
      test_stop1.save

      test_stop2 = Stop.new({'station_id' =>"#{test_station2.id}",'line_id' => "#{test_line.id}"})
      test_stop2.save

      test_line.all_stations.should eq [test_station1, test_station2]
    end
  end

  describe 'delete' do
    it 'deletes an existing line' do
      test_line = Line.new({'name' => 'Silver'})
      test_line.save
      test_line.delete
      Line.all.should eq []
    end
  end
end

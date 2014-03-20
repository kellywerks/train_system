require 'spec_helper'

describe Station do
  describe 'intialize' do
    it 'creates an instance of Station' do
      test_station = Station.new({'name' => 'Submarine'})
      test_station.should be_an_instance_of Station
    end
  end

  describe 'all' do
    it 'starts off as an empty array' do
      Station.all.should eq []
    end
  end

  describe 'save' do
    it 'saves all inputs into the database' do
      test_station = Station.new({'name' => 'Happy Valley'})
      test_station.save
      Station.all.should eq [test_station]
    end
  end

  describe '==' do
    it 'recognizes a match name in the database' do
      station1 = Station.new({'name' => 'Bikini Bottom'})
      station2 = Station.new({'name' => 'Bikini Bottom'})
      station1.should eq station2
    end
  end

  describe 'get_name' do
    it 'returns the name of the station with the id' do
      station1 = Station.new({'name' => 'Bikini Bottom'})
      station1.save
      station1.get_name("#{station1.id}").should eq 'Bikini Bottom'
    end
  end

  describe 'all_stations' do
    it 'list all stations for a particular line'do
      test_line1 = Line.new ({'name' => 'Green'})
      test_line2 = Line.new ({'name' => 'Magenta'})
      test_line1.save
      test_line2.save
      test_station = Station.new({'name' => 'Licorice Castle'})
      test_station.save
      test_stop1 = Stop.new({'station_id' =>"#{test_station.id}",'line_id' => "#{test_line1.id}"})
      test_stop1.save

      test_stop2 = Stop.new({'station_id' =>"#{test_station.id}",'line_id' => "#{test_line2.id}"})
      test_stop2.save

      test_station.all_lines.should eq [test_line1, test_line2]
    end
  end

  describe 'delete' do
    it 'deletes an existing station' do
      test_station = Station.new({'name' => 'Peanut Brittle House'})
      test_station.save
      test_station.delete
      Station.all.should eq []
    end
  end
end

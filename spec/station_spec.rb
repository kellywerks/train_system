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
end

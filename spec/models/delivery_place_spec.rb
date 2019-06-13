require 'rails_helper'
require 'spec_helper'

RSpec.describe DeliveryPlace, :type => :model do
  describe "validation tests" do
    it "is valid with valid attributes" do
      expect(DeliveryPlace.new(name: 'Dom', delivery_time: '10:10' , delivery_order_time: '9:00')).to be_valid
    end

    it "is not valid without name" do
      expect(DeliveryPlace.new(name: '', delivery_time: '10:10' , delivery_order_time: '9:00')).to_not be_valid
    end

    it "is not valid without delivery time" do
      expect(DeliveryPlace.new(name: '', delivery_time: '' , delivery_order_time: '9:00')).to_not be_valid
    end

    it "is not valid without delivery order time" do
      expect(DeliveryPlace.new(name: '', delivery_time: '11:00' , delivery_order_time: '')).to_not be_valid
    end

    it "is not valid when delivery time is elier than delivery order time" do
      expect(DeliveryPlace.new(name: 'Dom', delivery_time: '10:10' , delivery_order_time: '11:00')).to_not be_valid
    end
  end
  
  describe "#hours_and_minutes" do
    it "should return taime with format HH:MM" do
      place = DeliveryPlace.create(name: 'Dom', delivery_time: '10:10' , delivery_order_time: '9:00')
      time = place.hours_and_minutes(place.delivery_time)
      expect(time).to eq('10:10')
      expect(place.delivery_time).to_not eq('10:10')
    end
  end
end

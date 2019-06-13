# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Menu, type: :model do
  describe 'validation tests' do
    it 'is valid with valid attributes' do
      expect(Menu.new(
               date: Date.today,
               delivery_place_id: 1,
               order_before_at: DateTime.now
             )).to be_valid
    end

    it 'is  not valid without date' do
      expect(Menu.new(
               date: '',
               delivery_place_id: 1,
               order_before_at: DateTime.now
             )).to_not be_valid
    end

    it 'is  not valid with date from past' do
      expect(Menu.new(
               date: Date.yesterday,
               delivery_place_id: 1,
               order_before_at: DateTime.now
             )).to_not be_valid
    end

    it 'is  not valid without odder before date' do
      expect(Menu.new(
               date: Date.yesterday,
               delivery_place_id: 1,
               order_before_at: DateTime.now
             )).to_not be_valid
    end

    it 'is  not valid without delivery plcae id' do
      expect(Menu.new(
               date: Date.yesterday,
               delivery_place_id: '',
               order_before_at: DateTime.now
             )).to_not be_valid
    end

    it 'is  not valid with not existed delivery plcae id' do
      expect(Menu.new(
               date: Date.yesterday,
               delivery_place_id: 11,
               order_before_at: DateTime.now
             )).to_not be_valid
    end
  end

  describe '#date_format' do
    it 'expect date to be in format DD:MM:YYYY' do
      menu = Menu.create(
        date: '2030-11-11',
        delivery_place_id: 1,
        order_before_at: DateTime.now
      )
      date = menu.date_format(menu.date)
      expect(date).to eq('11.11.2030')
    end
  end
end

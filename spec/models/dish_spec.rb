# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Dish, type: :model do
  describe 'validation tests' do
    it 'is valid with valid attributes' do
      expect(Dish.new(
               name: 'Zupa',
               price: 10.10,
               menu_id: 1
             )).to be_valid
    end

    it 'is not valid without name' do
      expect(Dish.new(
               name: '',
               price: 10.10,
               menu_id: 1
             )).to_not be_valid
    end

    it 'is not valid without price' do
      expect(Dish.new(
               name: 'Zupa',
               price: '',
               menu_id: 1
             )).to_not be_valid
    end

    it 'is not valid with negative price' do
      expect(Dish.new(
               name: 'Zupa',
               price: -10.10,
               menu_id: 1
             )).to_not be_valid
    end

    it 'is not valid without menu id' do
      expect(Dish.new(
               name: 'Zupa',
               price: 10.10,
               menu_id: ''
             )).to_not be_valid
    end

    it 'is not valid with not existed menu id' do
      expect(Dish.new(
               name: 'Zupa',
               price: 10.10,
               menu_id: ''
             )).to_not be_valid
    end
  end

  describe '#name_with_price' do
    it 'expect date to return name with price' do
      dish = Dish.create(
        name: 'Zupa',
        price: 10.10,
        menu_id: 1
      )
      name_and_price = dish.name_with_price(dish)
      expect(name_and_price).to eq('Zupa: 10.10 zł')
    end
  end
end

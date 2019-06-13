# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe DeliveryPlacesController, type: :controller do
  describe 'GET index' do
    it 'returns all delivery places in index' do
      get 'index'
      expect(assigns(:delivery_places).count).to eq(5)
    end
  end

  describe 'POST create' do
    it 'render form' do
      get 'new'
      expect(response).to render_template(:new)
    end

    it 'create delivery place' do
      new_place = DeliveryPlace.create(
        name: 'House',
        delivery_time: '12:00',
        delivery_order_time: '11:00'
      )
      get 'index'
      expect(assigns(:delivery_places).count).to eq(6)
    end
  end
end

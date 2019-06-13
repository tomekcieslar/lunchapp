# frozen_string_literal: true

class DeliveryPlacesController < ApplicationController
  def index
    @delivery_places = DeliveryPlace.all.includes(:menus)
  end

  def show
    @delivery_place = DeliveryPlace.find(params[:id])
  end

  def new
    @delivery_place = DeliveryPlace.new
  end

  def create
    @delivery_place = DeliveryPlace.new(delivery_place_params)
    if @delivery_place.save
      redirect_to @delivery_place,
                  note: 'Delivery Place was created successfully'
    else
      render :new
    end
  end

  def edit
    @delivery_place = DeliveryPlace.find(params[:id])
  end

  def update
    @delivery_place = DeliveryPlace.find(params[:id])
    if @delivery_place.update(delivery_place_params)
      redirect_to @delivery_place,
                  note: 'Delivery Place was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @delivery_place = DeliveryPlace.find(params[:id])
    if @delivery_place.menus.empty?
      @delivery_place.destroy
      redirect_to delivery_places_path,
                  note: 'Delivery Place was delated successfully'
    else
      redirect_to @delivery_place
    end
  end

  private

  def delivery_place_params
    params.require(:delivery_place).permit(
      :name,
      :delivery_time,
      :delivery_order_time,
      :ahead_of_time
    )
  end
end

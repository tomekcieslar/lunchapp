# frozen_string_literal: true

class MenusController < ApplicationController
  def show
    delivery_place = DeliveryPlace.find(params[:delivery_place_id])
    @menu = delivery_place.menus.find(params[:id])
  end

  def new
    delivery_place = DeliveryPlace.find(params[:delivery_place_id])
    @menu = delivery_place.menus.new
  end

  def create
    delivery_place = DeliveryPlace.find(params[:delivery_place_id])
    @menu = delivery_place.menus.new(menu_params(delivery_place))
    if @menu.save
      redirect_to delivery_place_menu_path(delivery_place, @menu),
                  notice: 'Menu was created successfully'
    else
      render :new
    end
  end

  def edit
    delivery_place = DeliveryPlace.find(params[:delivery_place_id])
    @menu = delivery_place.menus.find(params[:id])
  end

  def update
    delivery_place = DeliveryPlace.find(params[:delivery_place_id])
    @menu = delivery_place.menus.find(params[:id])
    if @menu.update(menu_params(delivery_place))
      redirect_to delivery_place_menu_path(delivery_place, @menu),
                  notice: 'Menu was updated successfully'
    else
      render :new
    end
  end

  def destroy
    delivery_place = DeliveryPlace.find(params[:delivery_place_id])
    @menu = delivery_place.menus.find(params[:id])
    if @menu.destroy
      redirect_to delivery_place,
                  note: 'Delivery Place was delated successfully'
    else
      redirect_to @menu
    end
  end

  private

  def menu_params(place)
    date = if place.ahead_of_time
             params[:menu][:date].to_date - 1.day
           else
             params[:menu][:date]
           end
    order_before_at = "#{place.delivery_order_time.strftime('%H:%M')} #{date}"
    params.require(:menu).permit(:date).merge(order_before_at: order_before_at)
  end
end

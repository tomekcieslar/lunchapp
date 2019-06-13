# frozen_string_literal: true

class Api::SearchController < ApplicationController
  def index
    if params[:date].present?
      date = Time.zone.parse(params[:date])
      @menus = Menu.includes(:delivery_place).where('order_before_at > ?', date)
    else
      @menus = Menu.includes(:delivery_place).all
    end
    render json:  delivery_json.to_json
  end

  private

  def delivery_json
    @menus.uniq(&:delivery_place_id).map do |menu|
      {
        id: menu.delivery_place.id,
        name: menu.delivery_place.name,
        delivery_time: menu.delivery_place.hours_and_minutes(menu.delivery_place.delivery_time),
        delivery_order_time: menu.delivery_place.hours_and_minutes(menu.delivery_place.delivery_order_time),
        ahead_of_time: menu.delivery_place.ahead_of_time,
        menu: select_menus(menu.delivery_place_id)
      }
    end
  end

  def select_menus(id)
    @menus.select { |menu| menu.delivery_place_id == id }.collect
  end
end

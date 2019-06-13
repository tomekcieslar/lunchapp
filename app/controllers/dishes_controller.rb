# frozen_string_literal: true

class DishesController < ApplicationController
  def show
    menu = Menu.find(params[:menu_id])
    @dish = menu.dishes.find(params[:id])
  end

  def new
    menu = Menu.find(params[:menu_id])
    @dish = menu.dishes.new
  end

  def create
    menu = Menu.find(params[:menu_id])
    @dish = menu.dishes.new(dish_params)
    if @dish.save
      redirect_to delivery_place_menu_path(menu.delivery_place_id, menu),
                  notice: 'Dish was created successfully'
    else
      render :new
    end
  end

  def edit
    menu = Menu.find(params[:menu_id])
    @dish = menu.dishes.find(params[:id])
  end

  def update
    menu = Menu.find(params[:menu_id])
    @dish = menu.dishes.find(params[:id])
    if @dish.update(dish_params)
      redirect_to delivery_place_menu_path(menu.delivery_place_id, menu),
                  notice: 'Dish was updated successfully'
    else
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :price)
  end
end

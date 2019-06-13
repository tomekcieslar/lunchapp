# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :menu
  validates :name, presence: true
  validates :price, presence: true
  validate :price_is_positive

  def name_with_price(dish)
    price = ActionController::Base.helpers.number_with_precision(dish.price, precision: 2)
    "#{dish.name}: #{price} zł"
  end

  private

  def price_is_positive
    return if price.blank?

    errors.add(:price, 'must be positive') if price < 0
  end
end

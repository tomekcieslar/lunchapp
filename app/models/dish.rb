class Dish < ApplicationRecord
  belongs_to :menu
  validates :name, presence: true
  validates :price, presence: true

  def name_with_price(dish)
    "#{dish.name}: #{dish.price.to_s} zł"
  end
end

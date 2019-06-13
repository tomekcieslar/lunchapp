# frozen_string_literal: true

class DeliveryPlace < ApplicationRecord
  has_many :menus
  validates :name, presence: true
  validates :delivery_time, presence: true
  validates :delivery_order_time, presence: true
  validate :delivery_time_after_delivery_order_time

  def hours_and_minutes(time)
    time.strftime('%H:%M')
  end

  private

  def delivery_time_after_delivery_order_time
    return if delivery_order_time.blank? || delivery_time.blank?

    if delivery_time < delivery_order_time
      errors.add(:delivery_time, 'must be after order time')
    end
  end
end

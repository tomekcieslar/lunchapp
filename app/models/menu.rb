class Menu < ApplicationRecord
  belongs_to :delivery_place
  has_many :dishes
  validates :date, presence: true
  validates :date, uniqueness: {scope: :delivery_place_id}
  validate :date_from_past

  def date_format(date)
    date.strftime('%d.%m.%Y')
  end

  private

  def date_from_past
    return if date.blank?

    if date < Date.today
      errors.add(:date, "cant be picked from past")
    end
  end
end

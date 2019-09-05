class Schedule < ApplicationRecord
  belongs_to :unit

  validates :date, :start, :finish, :price, :unit_id, presence: true
  validates :price, numericality: { greater_than: 0 }
end

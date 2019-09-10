class Schedule < ApplicationRecord
  belongs_to :unit
  belongs_to :personal, foreign_key: 'account_id'

  validates :date, :start, :finish, :price, :unit_id, :account_id, presence: true
  validates :price, numericality: { greater_than: 0 }
end

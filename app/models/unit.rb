class Unit < ApplicationRecord
  has_many :enrollments

  has_many :accounts, through: :enrollments

  has_many :schedules
  has_many :personals, through: :schedules,
  class_name: 'Account', foreign_key: 'account_id'

  validates :ex_gym_ref, uniqueness: true


  def self.load_api
    byebug
    Gym.all.each do |gym|
      Unit.create(name: gym.name, ex_gym_ref: gym.id)
    end
  end
end

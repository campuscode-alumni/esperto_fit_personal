class Unit < ApplicationRecord
  has_many :enrollments

  has_many :accounts, through: :enrollments

  has_many :schedules
  has_many :personals, through: :schedules,
  class_name: 'Account', foreign_key: 'account_id'

  validates :ex_gym_ref, uniqueness: true


  def self.load_api
    Gym.all.each do |gym|
      unity = Unit.find_by(ex_gym_ref: gym.id, name: gym.name)
      if unity.blank?
        Unit.create(name: gym.name,
                    ex_gym_ref: gym.id,
                    working_days: gym.working_days,
                    cod: gym.cod,
                    open_hour: gym.open_hour,
                    close_hour: gym.close_hour,
                    address: gym.address)
                
      else
        unity.update(name: gym.name,
                  ex_gym_ref: gym.id,
                  working_days: gym.working_days,
                  cod: gym.cod,
                  open_hour: gym.open_hour,
                  close_hour: gym.close_hour,
                  address: gym.address)
      end
    end
  end
end

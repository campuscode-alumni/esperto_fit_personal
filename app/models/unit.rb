class Unit < ApplicationRecord
  has_many :enrollments
  
  has_many :accounts, through: :enrollments
  
  has_many :schedules
  has_many :personals, through: :schedules, 
  class_name: 'Account', foreign_key: 'account_id'
end

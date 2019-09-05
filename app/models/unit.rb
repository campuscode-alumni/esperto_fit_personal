class Unit < ApplicationRecord
  has_many :enrollments
  has_many :accounts, through: :enrollments
end

class Enrollment < ApplicationRecord
  belongs_to :account
  belongs_to :unit
end

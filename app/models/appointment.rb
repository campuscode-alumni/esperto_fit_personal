class Appointment < ApplicationRecord
  belongs_to :account
  has_one :customer, through: :customer_appointment
end
  #belongs_to :customer , optional: true, class_name: 'Account', foreign_key: 'customer_id'

#   has_one :agendamento

#   def ja_agendado?
#     agendamento.presence?
#   end
# end

# class agendamento
#    belongs_to Appointment
#    belongs_to Customer
# end

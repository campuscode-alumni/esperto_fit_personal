class Profile < ApplicationRecord
  enum gender: {male: 0, female: 1}

  belongs_to :account

  validates :first_name, :last_name, :document, :address, :date_of_birth, 
            :contact, :gender, :nickname, :payment_method, 
            presence: {message: 'Campo Obrigatório!'}

  def owner?(account)
    self.account == account
  end
end

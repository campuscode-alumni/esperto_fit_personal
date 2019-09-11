class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :document, presence: true

  has_one :enrollment
  has_one :profile

  def personal?
    is_a? Personal
  end 

  def profile?
    !profile.nil?
  end
 
end

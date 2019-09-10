require 'rails_helper'

feature 'Customer reserves an appointment' do
  scenario 'Successfully' do
    user = create(:customer)
    schedule
    login_as(user, scope: :account)
  end
end
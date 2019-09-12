require 'rails_helper'

feature 'Customer can see apppointments' do
  scenario 'only if is authenticated' do
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: account, unit: unit)
    
    login_as(customer, scope: :account)
  end
  scenario 'only if is authenticated' do
    pending
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: account, unit: unit)
    
    login_as(customer, scope: :account)
  end
end
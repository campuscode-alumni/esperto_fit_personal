require 'rails_helper'

feature 'Customer selects plan on resigration' do
  scenario 'successfully' do
    cpf_status_empty
    list_gyms

    user = create(:account, email: 'meu@email.com', document:'12345678908')
    profile = create(:profile, account: user)
    unit = create(:unit)
    user.unit = unit

    login_as(account, scope: :account)
    visit root_path

    expect(current_path).to eq new_plan_path

  end
end
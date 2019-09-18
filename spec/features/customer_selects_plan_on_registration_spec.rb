require 'rails_helper'

feature 'Customer selects plan on resigration' do
  scenario 'view registration path after login if has no plan' do
    cpf_status_empty
    list_gyms
    user = create(:customer, email: 'meu@email.com', document:'12345678908')
    profile = create(:profile, account: user, plan: nil)
    unit = create(:unit)
    user.unit = unit
    list_plans(unit.ex_gym_ref)
    login_as(user, scope: :account)
    visit root_path

    expect(current_path).to eq new_plan_path

  end

  scenario 'view registration path after login if has no plan' do
    cpf_status_empty
    list_gyms
    unit = create(:unit)
    user = create(:customer, email: 'meu@email.com', document:'12345678908',unit: unit)
    profile = create(:profile, account: user, plan: nil)
    list_plans(unit.ex_gym_ref)

    login_as(user, scope: :account)
    visit root_path
    select 'Executivo', from: 'Plano'
    click_on 'Enviar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Matriculado com sucesso')

  end
end

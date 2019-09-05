require 'rails_helper'

feature 'Add unit to customer' do
  scenario 'successfully' do
    #arrange
    unit = create(:unit, name: 'Paulista')
    user = create(:customer)
    #act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on 'Matricular-se Nesta Unidade'
    #assert
    expect(page).to have_content('Matricula realizada com sucesso')
    expect(page).to have_content("Você é membro desta unidade")
    expect(current_path).to eq unit_path(unit)
    expect(user.unit.id).to eq unit.id     
  end
end
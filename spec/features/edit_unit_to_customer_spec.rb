require 'rails_helper'

feature 'Customer changes unit' do
  scenario 'and views the current unit before changing' do
    #arrage
    old_unit = create(:unit, name: 'Old Unit')
    user = create(:customer, unit: old_unit)
    #act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    #assert
    within("#current_unit") do
      expect(page).to have_css('span',text:"Sua unidade atual é #{user.unit.name}")
    end
  end
  scenario 'changes successfully' do
    #arrage
    old_unit = create(:unit, name: 'Old Unit')
    new_unit = create(:unit, name: 'New Unit')
    user = create(:customer, unit: old_unit)
    #act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on new_unit.name
    click_on 'Mudar-se Para Esta Unidade'
    #assert
    user.reload
    expect(page).to have_content('Matricula realizada com sucesso')
    #expect(page).to have_content("Você é membro desta unidade")
    #expect(current_path).to eq unit_path(new_unit)
    expect(user.unit.id).to eq new_unit.id
  end
  
  scenario 'and must be enrolled with another unit' do
    old_unit = create(:unit, name: 'Old Unit')
    user = create(:customer, unit: old_unit)
    #act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on old_unit.name
    #assert
    expect(page).to have_content("Você é membro desta unidade")
    expect(page).not_to have_link("Mudar-se Para Esta Unidade")
  end
end

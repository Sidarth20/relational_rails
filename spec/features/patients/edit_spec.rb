require 'rails_helper'
RSpec.describe "the patient edit" do
  it 'links to the edit page' do
    # User Story 14, Child Update (x2)
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
    hospital = Hospital.create!(name: 'Major Hospital')
    patient = hospital.patients.create!(name: 'Randy')

     visit '/patients'
     click_button "Update Patient #{patient.name}"
     expect(current_path).to eq("/patients/#{patient.id}/edit")
  end

  it 'can edit the patient' do
    hospital = Hospital.create!(name: 'Major Hospital')
    patient = hospital.patients.create!(name: 'Randy')

    visit '/patients'

    expect(page).to have_content('Randy')

    click_button "Update Patient Randy"

    fill_in 'Name', with: 'Robert'
    fill_in 'Age', with: '77'
    fill_in 'Visitors', with: 'false'

    click_button 'Update Patient'

    expect(current_path).to eq("/patients")
    expect(page).to have_content('Robert')
    expect(page).to have_content('77')
    expect(page).to have_content('false')
  end

  # it 'can edit the hospital' do
  #   hospital = Hospital.create!(name: 'Major Hospital')
  #
  #   visit '/hospitals'
  #
  #   expect(page).to have_content('Major Hospital')
  #
  #   click_button 'Edit Major Hospital'
  #
  #   fill_in('Name', with: 'Major Grand Hospital')
  #   fill_in('max_capacity', with: 'true')
  #   fill_in('beds', with: '250')
  #   click_button 'Update Hospital'
  #   new_hospital_id = Hospital.last.id
  #
  #   expect(current_path).to eq("/hospitals")
  #   expect(page).to have_content('Major Grand Hospital')
  #   visit "/hospitals/#{new_hospital_id}"
  #   expect(page).to have_content('true')
  # end
end
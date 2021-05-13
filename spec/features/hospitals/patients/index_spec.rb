require 'rails_helper'

RSpec.describe "hospital patient index page", type: :feature do
  it "can see the patients for the hospital" do
    # User Story 5, Parent Children Index (x2)
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    visit "/hospitals/#{hospital.id}/patients"
    save_and_open_page
    expect(page).to have_content(miko.name)
  end

  # it "can see the patients for the hospital"
  #   hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
  #   miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
  #   tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)
  #
  #   visit "/hospitals/#{hospital.id}/patients"
  #   click_on
  #   expect(page).to have_content(miko.name)

end
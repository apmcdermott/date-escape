require 'spec_helper'

feature 'User creates scenario' do
  background do
    visit root_path
    click_link 'New Scenario'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'SOS'

    click_button 'Create Scenario'

    expect(page).to have_content 'Scenario successfully created'
    expect(page).to have_content 'SOS'
  end

  scenario 'unsuccessfully due to required fields missing' do
    click_button 'Create Scenario'

    expect(page).to have_content "Title can't be blank"

    # save_and_open_page
  end
end

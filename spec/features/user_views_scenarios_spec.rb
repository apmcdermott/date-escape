require 'spec_helper'

feature 'User views list of scenarios' do
  scenario 'on the root page' do
    scenarios = create_list(:scenario, 3)

    visit root_path

    scenarios.each do |scenario|
      expect(page).to have_content scenario.title
      expect(page).to have_content true
    end
  end
end

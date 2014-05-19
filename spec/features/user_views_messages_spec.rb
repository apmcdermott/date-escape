require 'spec_helper'

feature 'User views list of messages' do
  # background do
  #   visit root_path
  #   click_link 'View All Messages'
  # end

  scenario 'on the messages index page' do
    messages = create_list(:message, 3)

    visit messages_path

    messages.each do |message|
      expect(page).to have_content message.trigger
      expect(page).to have_content message.content
    end
  end
end

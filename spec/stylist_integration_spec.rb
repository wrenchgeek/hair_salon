require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a stylist') do
    visit('/')
    fill_in('name', :with =>'Bruce Wayne')
    click_button('Add Stylist')
    expect(page).to have_content('Bruce Wayne')
  end
end

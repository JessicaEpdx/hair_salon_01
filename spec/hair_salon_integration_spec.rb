require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)




describe('add client/stylist form path', {:type => :feature}) do
  it('allows user to add client or stylist, sends user to list of clients or stylists') do
    visit('/')
    fill_in('client_name', :with => 'Deborah Gibson')
    click_button('Add Client')
    expect(page).to have_content('Deborah Gibson')
    visit('/')
    fill_in('stylist_name', :with => 'Harry Potter')
    click_button('Add Stylist')
    expect(page).to have_content('Harry Potter')
  end
end

require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add client form path', {:type => :feature}) do
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

describe('individual client and stylist page path') do
  it('send user to individual pages when name link is clicked') do
    client = Client.new({:name => "Bill", :id => nil, :stylist_id => nil})
    client.save()
    stylist = Stylist.new({:name => "Bob", :id => nil})
    stylist.save()
    visit("/clients/#{client.id()}")
    expect(page).to have_content("Bill")
    visit("/stylists/#{stylist.id()}")
    expect(page).to have_content("Bob")
  end
end

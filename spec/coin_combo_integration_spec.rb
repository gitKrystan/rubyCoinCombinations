require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the coin combo path', {:type => :feature}) do
  it('processes the user entry and returns the proper coin combination') do
    visit('/')
    fill_in('change', :with => 2)
    click_button('Send')
    expect(page).to have_content('2 pennies')
  end
  #
  # it('processes the user entry and returns the proper coin combination') do
  #   visit('/')
  #   fill_in('change', :with => 16)
  #   click_button('Send')
  #   expect(page).to have_content('1 dime, 1 nickle, and 1 penny')
  # end
end


# it('returns a list of coins with commas when 3 coin types are required') do
#   expect(16.coin_combo()).to(eq("1 dime, 1 nickle, and 1 penny"))
# end
#

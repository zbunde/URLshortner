require          'spec_helper'
require          'capybara/rspec'
require_relative '../url_shortener'

Capybara.app = UrlShortener

feature 'UrlShortener' do
  scenario "user sees form form field and button on home page" do 
    visit '/'
    fill_in 'urlText', with: 'tutorials.gschool.it'
    click_on('Shorten')
    expect(page).to have_content('Original URL')
    expect(page).to have_content('tutorials.gschool.it')
  end
end

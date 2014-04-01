require          'spec_helper'
require          'capybara/rspec'
require_relative '../url_shortener'

Capybara.app = UrlShortener

feature 'UrlShortener' do
  scenario "User sees form form field and button on home page" do
    visit '/'
    fill_in 'urlText', with: 'tutorials.gschool.it'
    click_on('Shorten')
    expect(page).to have_content('http://wwww.example.com/1')
    visit '/'
    fill_in 'urlText', with: 'whatever.com'
    click_on('Shorten')
    expect(page).to have_content('http://wwww.example.com/2')
  end
end

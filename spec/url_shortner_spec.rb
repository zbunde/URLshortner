require          'spec_helper'
require          'capybara/rspec'
require_relative '../url_shortener'

Capybara.app = UrlShortener

feature 'UrlShortener' do
  scenario "user sees form form field and button on home page" do 
    visit '/'
    fill_in 'urlText', with: 'tutorials.gschool.it'
    click_on('Shorten')
  end
end

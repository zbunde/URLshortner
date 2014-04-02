require          'spec_helper'
require          'capybara/rspec'
require_relative '../url_shortener'

Capybara.app = UrlShortener

feature 'UrlShortener' do
  scenario "User sees form form field and button on home page" do
    visit '/'
    fill_in 'urlText', with: 'http://tutorials.gschool.it'
    click_on('Shorten')
    expect(page).to have_content('http://wwww.example.com/1')
    visit '/'
    fill_in 'urlText', with: 'http://www.google.com'
    click_on('Shorten')
    expect(page).to have_content('http://wwww.example.com/2')
    click_on('short')
    page.has_xpath?('google.com')
  end

  scenario "User sees error message if they submit blank input" do
    visit '/'
    fill_in 'urlText', with: ""
    click_on('Shorten')
    expect(page).to have_content('URL cannot be blank')
  end

  scenario "User enters a non valid URL" do
    visit '/'
    fill_in 'urlText', with: "aifjiafaiofhiafhaifh"
    click_on('Shorten')
    expect(page).to have_content('This is not a valid URL')
  end
end

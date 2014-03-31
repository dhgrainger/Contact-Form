require 'spec_helper'

feature "User contacts sites staff", %q{
  As a site visitor
  I want to contact the site's staff
  So that i can tell them how awesome they are
} do

  before(:each) do
      visit '/inquiries/new'
      click_on "Sign up"
      user = "doug"
      fill_in "Email", with: "dhgrainger@gmail.com"
      fill_in "Password", with: "asdfg123"
      fill_in "Password confirmation", with: "asdfg123"
      click_on "Sign up"
  end

  context 'with valid attributes' do
    it 'creates an iquiry with valid attributes' do
      visit '/inquiries/new'

      fill_in "Email", with: "dhgrainger@gmail.com"
      fill_in "Subject", with: "you're awesome"
      fill_in "Description", with: "this place is a mess awesome job"
      fill_in "First name", with: "doug"
      fill_in "Last name", with: "grainger"

      click_on "Submit Inquiry"

      expect(page).to have_content "you're awesome"
    end

    it 'requires a user to have an first name' do
      fill_in "Email", with: 'dhgrainger@gmail.com'
      fill_in "Subject", with: "you're awesome"
      fill_in "Description", with: "this place is a mess awesome job"
      fill_in "First name", with: ''
      fill_in "Last name", with: "grainger"

      click_on "Submit Inquiry"

      expect(page).to have_content("First name can't be blank")
    end
  end
end

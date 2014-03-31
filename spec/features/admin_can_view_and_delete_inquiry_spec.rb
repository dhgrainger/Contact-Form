require 'spec_helper'

feature "Admin views inquiries", %q{
 As an admin
I want to delete an inquiry
So that I can remove spam or other undesirable inquiries
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

  it 'allows admin to delete an inquiry' do
    visit '/inquiries/new'

      fill_in "Email", with: "dhgrainger@gmail.com"
      fill_in "Subject", with: "you're awesome"
      fill_in "Description", with: "this place is a mess awesome job"
      fill_in "First name", with: "doug"
      fill_in "Last name", with: "grainger"

      click_on "Submit Inquiry"

      expect(page).to have_content "you're awesome"

      click_on "you're awesome"

      click_on "Destroy"

      expect(page).to_not have_content "you're awesome"
  end
end

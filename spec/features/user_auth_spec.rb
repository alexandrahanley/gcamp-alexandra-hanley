require 'rails_helper'

describe "User can register and sign in or out" do

  scenario "user can sign up" do
    visit '/signup'
    fill_in 'user[first_name]', with: "Test"
    fill_in 'user[last_name]', with: "Test"
    fill_in 'user[email]', with: "test@test.com.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Sign Up"
    expect(page).to have_content("Sign Out")
  end

  scenario "user can sign in" do
    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "alexandrahanley@mail.com", password: "z", password_confirmation: "z")
    visit '/signin'
    fill_in 'email', with: "alexandrahanley@mail.com"
    fill_in 'password', with: "z"
    click_on "Sign In"
    expect(page).to have_content("Alexandra Hanley")
  end

  scenario "user can sign out" do
    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "alexandrahanley@mail.com", password: "z", password_confirmation: "z")
    visit '/signin'
    fill_in 'email', with: "alexandrahanley@mail.com"
    fill_in 'password', with: "z"
    click_on "Sign In"
    expect(page).to have_content("Alexandra Hanley")
    click_on "Sign Out"
    expect(page).to have_content("Signin")

  end

end

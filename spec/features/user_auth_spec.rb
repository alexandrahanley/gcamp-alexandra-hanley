require 'rails_helper'

describe "User can register and sign in or out" do

  scenario "user can sign up" do
    visit '/signup'
    fill_in 'user[first_name]', with: "b"
    fill_in 'user[last_name]', with: "b"
    fill_in 'user[email]', with: "b@b.com"
    fill_in 'user[password]', with: "b"
    fill_in 'user[password_confirmation]', with: "b"
    click_on "Sign Up"
    expect(page).to have_content("b b")
  end

  scenario "user can sign in" do
    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "alexandrahanley@mail.com",
    password: "z", password_confirmation: "z")
    visit '/signin'
    fill_in 'email', with: "alexandrahanley@mail.com"
    fill_in 'password', with: "z"
    click_on "Sign In"
    expect(page).to have_content("b b")
  end

  scenario "user can sign out" do
    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "alexandrahanley@mail.com",
    password: "z", password_confirmation: "z")
    visit '/signin'
    fill_in 'email', with: "alexandrahanley@mail.com"
    fill_in 'password', with: "z"
    click_on "Sign In"
    expect(page).to have_content("b b")
    click_on "Sign Out"
    expect(page).to have_content("Sign In")

  end

end

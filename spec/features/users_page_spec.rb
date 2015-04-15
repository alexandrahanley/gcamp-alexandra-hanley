require 'rails_helper'

describe 'User can CRUD users' do


  scenario 'User can create a user' do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_on "Users"
    click_on "New User"
    fill_in 'user[first_name]', with: "Alexandra"
    fill_in 'user[last_name]', with: "Hanley"
    fill_in 'user[email]', with: "z@z.com"
    fill_in 'user[password]', with: "z"
    fill_in 'user[password_confirmation]', with: "z"
    click_on "Create User"
    expect(page).to have_content("z@z.com")
    expect(page).to have_content("User was successfully created.")
  end


  scenario 'User can view a show page for a user' do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_on "Users"
    expect(page).to have_content("Alexandra Hanley")
    click_link("name")
    expect(page).to have_content("Alexandra Hanley")
  end


  scenario 'User can edit a user' do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_on "Users"
    expect(page).to have_content("Alexandra Hanley")
    click_on "Edit"
    fill_in 'user[first_name]', with: "Alejandra"
    click_on("Update User")
    expect(page).to have_content("Alejandra")
  end


  scenario 'User can delete a user' do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_on "Users"
    expect(page).to have_content("Alexandra Hanley")
    click_on "Delete"
    expect(page).to have_content("User was successfully deleted.")
  end

end

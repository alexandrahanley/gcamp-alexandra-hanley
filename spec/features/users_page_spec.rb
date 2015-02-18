require 'rails_helper'

describe 'User can CRUD users' do

  scenario 'User can create a user' do
    visit '/'
    click_on "Users"
    click_on "New User"
    fill_in 'user[first_name]', with: "Alexandra"
    fill_in 'user[last_name]', with: "Hanley"
    fill_in 'user[email]', with: "alexandrahanley@mail.com"
    click_on "Create User"
    expect(page).to have_content("alexandrahanley@mail.com")
    expect(page).to have_content("User was successfully created.")
  end


  scenario 'User can view a show page for a user' do

    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "alexandrahanley@mail.com")
    visit "/users/#{@user.id}"
    expect(page).to have_content("Alexandra")
  end



  scenario 'User can edit a user' do
    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "ah@gmail.com")
    visit "/users/#{@user.id}"
    click_on "Edit"
    fill_in 'user[first_name]', with: "Alejandra"
    click_on("Update User")
    expect(page).to have_content("Alejandra")

  end


  scenario 'User can delete a user' do
    @user = User.create(first_name: "Alexandra", last_name: "Hanley", email: "ah@gmail.com")
    visit "/users/#{@user.id}"
    expect(page).to have_content("Alexandra")
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_content("User was successfully deleted.")
  end

end

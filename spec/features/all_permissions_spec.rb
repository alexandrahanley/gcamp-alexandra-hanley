require 'rails_helper'

describe "Unique roles have unique permissions" do

  before :each do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    User.create(first_name: "Bob", last_name: "Smith",
                email: "bobsmith@gmail.com", password: "password")
    User.create(first_name: "Sam", last_name: "Adams",
                email: "samadams@gmail.com", password: "password")

    Project.create(name: "Project1")
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
  end

  scenario "Admin can view any project on index page" do
    expect(page).to have_content "Project1"
  end

  scenario "User can only view projects they created or are members of" do
    click_on "Sign Out"
    click_on "Signin"
    fill_in 'email', with: "bobsmith@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    expect(page).to_not have_content "Project1"
  end

  scenario 'User is auto added as project owner with edit/delete permissions' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("Project1")
    first(:link, 'Project1').click
    expect(page).to have_content("Delete")
    expect(page).to have_content("Edit")
  end

  scenario 'User is directed to tasks page upon project creation' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("New Task")
  end

  scenario 'Only project member has task edit permissions' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("Project1")
    click_on "New Task"
    fill_in 'task[description]', with: "My Task"
    click_on "Create Task"
    expect(page).to have_content("Edit")
  end

  scenario "Admins see all emails" do
   visit '/users'
   expect(page).to have_content("bobsmith@gmail.com")
  end

  scenario "User does not see other user emails" do
    click_on "Sign Out"
    click_on "Signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_on "Users"
    expect(page).not_to have_content "admin@example.com"
  end

  scenario "Non members cannot manage membership actions for projects" do
    click_on "Sign Out"
    click_on "Signin"
    fill_in 'email', with: "bobsmith@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_link("new-pro")
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    first(:link, 'Project1').click
    first(:link, 'Members').click
    expect(page).not_to have_content("Update")
  end

  scenario "Members can manage membership actions for projects" do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    first(:link, 'Project2').click
    first(:link, 'Members').click
    expect(page).to have_button("Create Membership")
  end

  scenario "Users members and owners can only edit themselves" do
    click_on "Sign Out"
    click_on "Signin"
    fill_in 'email', with: "bobsmith@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    visit '/users'
    click_on "Sam Adams"
    expect(page).not_to have_content("Edit")
  end

  scenario "Admin can edit all users" do
    visit '/users'
    click_on "Bob Smith"
    expect(page).to have_content("Edit")
  end

end

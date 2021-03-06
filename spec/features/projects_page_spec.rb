require 'rails_helper'

describe 'User can CRUD projects' do

  before :each do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
  end

  scenario 'User can create a project' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("Project1")
    expect(page).to have_content("Project was successfully created.")
  end


  scenario 'User can view a show page for a project' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    expect(page).to have_content("Project2")
  end

  scenario 'User can edit a project' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    expect(page).to have_content("Project2")
    click_link("pro-name")
    click_on "Edit"
    fill_in 'project[name]', with: "Project4"
    click_on("Update Project")
    expect(page).to have_content("Project4")
  end

  scenario 'User can delete a project' do
    click_link("new-pro")
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    expect(page).to have_content("Project2")
    click_link("pro-name")
    click_on "Delete"
    expect(page).to have_content("Project was successfully deleted.")
  end

end

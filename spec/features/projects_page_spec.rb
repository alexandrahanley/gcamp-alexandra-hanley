require 'rails_helper'

describe 'User can CRUD projects' do

  scenario 'User can create a project' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v", admin: :true)
    visit '/'
    click_on "Projects"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("Project1")
    expect(page).to have_content("Project was successfully created.")
  end


  scenario 'User can view a show page for a project' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Projects"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    expect(page).to have_content("Project2")

  end


  scenario 'User can edit a project' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Projects"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    expect(page).to have_content("Project2")
    click_on "Edit"
    fill_in 'project[name]', with: "Project4"
    click_on("Update Project")
    expect(page).to have_content("Project4")

  end

  scenario 'User can delete a project' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Projects"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Project2"
    click_on "Create Project"
    expect(page).to have_content("Project2")
    click_on "Delete"
    expect(page).to have_content("Project was successfully deleted.")
  end

end

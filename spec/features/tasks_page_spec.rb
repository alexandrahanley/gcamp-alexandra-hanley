require 'rails_helper'

describe 'User can CRUD tasks' do

  before :each do
    User.create(first_name: "Alexandra", last_name: "Hanley",
                email: "alexandra@gmail.com", password: "password", admin: true)
    visit "/signin"
    fill_in 'email', with: "alexandra@gmail.com"
    fill_in 'password', with: "password"
    click_on "Sign In"
    click_link("new-pro")
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("Project1")
  end

  scenario 'User can create a task' do
    click_on "New Task"
    fill_in 'task[description]', with: "My Task"
    click_on "Create Task"
    expect(page).to have_content("My Task")
  end


  scenario 'User can view a show page for a task' do
    click_on "New Task"
    fill_in 'task[description]', with: "My Task"
    click_on "Create Task"
    expect(page).to have_content("Task was successfully created.")
    click_link("My Task")
    expect(page).to have_content("My Task")
  end


  scenario 'User can edit a task' do
    click_on "New Task"
    fill_in 'task[description]', with: "My Task"
    click_on "Create Task"
    expect(page).to have_content("Task was successfully created.")
    click_on "Edit"
    fill_in 'task[description]', with: "Proofread-2"
    click_on "Update Task"
    expect(page).to have_content("Task was successfully updated!")
  end

  scenario 'User can delete a task' do
    click_on "New Task"
    fill_in 'task[description]', with: "My Task"
    click_on "Create Task"
    expect(page).to have_content("Task was successfully created.")
    click_link("destroy")
    expect(page).to have_content("Task was successfully destroyed.")
  end

end

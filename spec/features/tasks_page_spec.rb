require 'rails_helper'

describe 'User can CRUD tasks' do

  scenario 'User can create a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    @project = Project.create(name: "Homework")
    visit '/'
    click_on "Signin"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    visit '/projects'
    click_on "Homework"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Proofread"
    click_on "Create Task"
    expect(page).to have_content("Proofread")
    expect(page).to have_content("Task was successfully created.")
  end


  scenario 'User can view a show page for a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    @project = Project.create(name: "Homework")
    visit '/'
    click_on "Signin"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    visit '/projects'
    click_on "Homework"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Proofread"
    click_on "Create Task"
    click_on "Show"
    expect(page).to have_content("Proofread")

  end


  scenario 'User can edit a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    @project = Project.create(name: "Homework")
    visit '/'
    click_on "Signin"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    visit '/projects'
    click_on "Homework"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Proofread"
    click_on "Create Task"
    click_on "Edit"
    fill_in 'task[description]', with: "Proofread-2"
    click_on "Update Task"
    expect(page).to have_content("Task was successfully updated!")
  end

  scenario 'User can delete a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    @project = Project.create(name: "Homework")
    visit '/'
    click_on "Signin"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    visit '/projects'
    click_on "Homework"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Proofread"
    click_on "Create Task"
    click_on("Delete")
    expect(page).to have_content("Task was successfully destroyed.")
  end

end

require 'rails_helper'

describe 'User can CRUD tasks' do

  scenario 'User can create a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Tasks"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Party"
    click_on "Create Task"
    expect(page).to have_content("Party")
    expect(page).to have_content("Task was successfully created.")
  end


  scenario 'User can view a show page for a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Tasks"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Party"
    click_on "Create Task"
    expect(page).to have_content("Party")
    expect(page).to have_content("Task was successfully created.")
    @task = Task.create(:description => "Party")
    visit "/tasks/#{@task.id}"
    expect(page).to have_content("Party")
  end


  scenario 'User can edit a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Tasks"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Party"
    click_on "Create Task"
    expect(page).to have_content("Party")
    expect(page).to have_content("Task was successfully created.")
    @task = Task.create(:description => "Party")
    visit "/tasks/#{@task.id}"
    expect(page).to have_content("Party")
    visit "/tasks/#{@task.id}/edit"
    fill_in 'task[description]', :with => "New Party"
    click_on("Update Task")
    expect(page).to have_content("New Party")
  end

  scenario 'User can delete a task' do
    @user = User.create(first_name: "V", last_name: "V", email: "v@v.com", password: "v", password_confirmation: "v")
    visit '/'
    click_on "Tasks"
    fill_in 'email', with: "v@v.com"
    fill_in 'password', with: "v"
    click_on "Sign In"
    click_on "Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Party"
    click_on "Create Task"
    expect(page).to have_content("Party")
    visit '/tasks'
    expect(page).to have_content("Party")
    click_on("Delete")
    expect(page).to have_content("Task was successfully destroyed.")
  end

end

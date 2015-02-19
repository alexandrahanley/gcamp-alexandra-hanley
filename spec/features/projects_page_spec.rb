require 'rails_helper'

describe 'User can CRUD projects' do

  scenario 'User can create a project' do
    visit '/'
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Project1"
    click_on "Create Project"
    expect(page).to have_content("Project1")
    expect(page).to have_content("Project was successfully created.")
  end


  scenario 'User can view a show page for a project' do

    @project = Project.create(:name => "Project2")
    visit "/projects/#{@project.id}"
    expect(page).to have_content("Project2")

  end


  scenario 'User can edit a project' do

    @project = Project.create(name: "Project3")
    visit "/projects/#{@project.id}/edit"
    fill_in 'project[name]', with: "Project4"
    click_on("Update Project")
    expect(page).to have_content("Project4")

  end

  scenario 'User can delete a project' do
    visit '/'
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Project5"
    click_on "Create Project"
    expect(page).to have_content("Project5")
    click_on("Delete")
    expect(page).to have_content("Project was successfully deleted.")
  end

end

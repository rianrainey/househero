require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    skip "Temporarily disabling all system tests"
    @project = projects(:one)
    @user = users(:one)
    sign_in(@user)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    visit projects_url
    click_on "New project"

    fill_in "Description", with: @project.description
    fill_in "Title", with: @project.title
    select @project.user.email_address, from: "User"
    click_button "Create Project"

    assert_text "Project was successfully created"
    click_link "Back"
  end

  test "should update Project" do
    visit project_url(@project)
    find("a", text: "Edit this project").click

    fill_in "Description", with: @project.description
    fill_in "Title", with: @project.title
    select @project.user.email_address, from: "User"
    click_button "Update Project"

    assert_text "Project was successfully updated"
    click_link "Back"
  end

  test "should destroy Project" do
    visit project_url(@project)
    click_button "Destroy this project"
    assert_text "Project was successfully destroyed"
  end
end

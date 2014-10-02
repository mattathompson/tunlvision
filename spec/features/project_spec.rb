require 'rails_helper'

feature 'creating products' do

  before :each do
    @user = create :user
    login @user
  end

  context "New Project" do
    before :each do
      visit new_project_path
    end

    it "can create projects" do
      project = build :project
      %w(Title Client Description).each do |value|
        fill_in(value, :with => project[:"#{value.downcase}"])
      end
      click_button('Create Project')
    end
  end

  context "Edit Project" do
    before :each do
      project1 = build :project
      @user.projects << project1
      visit project_path(project1)
    end

    focus "allows you to edit an existing project" do
      click_link('Edit')
      project2 = build :project

      %w(Title Client Description).each do |value|
        fill_in(value, :with => project2[:"#{value.downcase}"])
      end
      click_button('Update Project')
      expect( page ).to have_content("Project Successfully updated!")
    end



  end
end

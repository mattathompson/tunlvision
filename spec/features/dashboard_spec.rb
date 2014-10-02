require 'rails_helper'

feature 'dashboard' do

  before :each do
    @user = create :user
    login @user
  end

  context "Active Projects" do


    before :each do
      @project = build :project
      @user.projects << @project
      visit root_path
    end

    it "displays all projects" do
      expect( page ).to have_content("#{@project.title}")
    end

    it "list shows whether a project is active" do
      within('.project') { expect( page ).to have_content("Active") }
    end

    it "Contains a link for a project show" do
      within('.project') { click_link(@project.title) }
    end


  end

  it "list shows whether a project is unactive" do
    @project = build :project, :completed
    @user.projects << @project
    visit root_path
    within('.project') {expect( page ).to have_content("Finished")}
  end

  it "Contains a link for new projects" do
    visit root_path
    click_link('Create Project')
  end


end

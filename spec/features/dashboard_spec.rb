require 'rails_helper'

feature 'dashboard' do

  before :each do
    @user = create :user
    login @user
  end

  focus "displays all projects" do
    project = build :project
    @user.projects << project
    visit root_path
    expect( page ).to have_content(project.title)
  end

  it "list shows whether a project is active or inactive" do
    project = build :product, :active

    visit root_path
    within('.projects') { expect( page ).to have_content("Active") }


  end

  it "It shows current users name"

end

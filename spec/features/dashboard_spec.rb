require 'rails_helper'

feature 'dashboard' do

  before :each do
    @user = create :user
    login @user
  end

  it "displays all projects" do
    visit root_path
    expect( page ).to have_content("Stories")
  end

  it "list shows whether a project is active or not"
  it "It shows current users name"

end

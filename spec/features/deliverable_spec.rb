require 'rails_helper'

feature 'Deliverables' do

  before :each do
    @user = create :user
    login @user
    @project = build :project
    @user.projects << @project
  end

  context "can be Created" do

    before :each do
      visit project_path(@project)
      @deliverable = build :deliverable
    end

    focus "filling out the new form" do
      click_link('Add Deliverable')
      expect( page ).to have_content("Create Deliverable")

      %w(Title Description).each do |value|
        fill_in(value, :with => @deliverable[:"#{value.downcase}"])
      end
      save_and_open_page
      click_button('Create Deliverable')
      expect( page ).to have_content("Created new deliverable")
    end
  end
end

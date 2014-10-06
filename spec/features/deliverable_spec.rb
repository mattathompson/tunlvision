require 'rails_helper'

feature 'Deliverables' do

  before :each do
    @user = create :user
    login @user
    @project = build :project
    @user.projects << @project
  end

  context "can be Created" do

    it "filling out the new form" do
      visit project_path(@project)
      @deliverable = build :deliverable

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

  context "can be modified" do

    focus "modifying a existing deliverable" do
      @deliverable = create :deliverable
      @project.deliverables << @deliverable
      @modified_deliverable = build :deliverable
      visit project_path(@project)

      click_link("#{@deliverable.title}")

      expect( page ).to have_content("#{@deliverable.title}")
      click_link("Edit")

      %w(Title Description).each do |value|
        fill_in(value, :with => @modified_deliverable[:"#{value.downcase}"])
      end

      click_button("Update Deliverable")

    end

  end
end

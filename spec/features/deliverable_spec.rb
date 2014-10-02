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
      binding.pry
      visit project_path(@project)
      @deliverable = build :deliverable
    end

    focus "filling out the new form" do
      click_link('Add Deliverable')
      expect( page ).to have_content("Create Deliverable")

      %w(Title Description).each do |value|
        fill_in(value, :with => deliverable[:"#{value.downcase}"])
      end
      click_button('Create Deliverable')
    end
  end
end

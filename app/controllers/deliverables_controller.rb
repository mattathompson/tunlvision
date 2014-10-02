class DeliverablesController < ApplicationController
  before_action :find_project

  def show

  end

  def new
    @deliverable = @project.deliverables.new
  end


  def create

  end


  def edit

  end

  def update

  end

  def destroy

  end


  private

  def create_params

  end

  def find_project
    @project = current_user.projects.find params[:project_id]
  end

end

class CollaboratorsController < ApplicationController
  before_action :find_project

  def index
    @collaborators = @project.collaborators.all
  end


  def new

  end


  def create
    email = params[:email]
    if @project.collaborate params[:email]
      redirect_to @project, :flash => {:success => "#{email} was successfully added as a collaborator!"}
    else
      redirect_to root_path, :flash => {:failure => "Something went wrong :("}
    end
  end


  def edit

  end


  def update

  end


  def destroy

  end

  private

  def find_project
    @project = current_user.projects.find params[:project_id]
  end



end

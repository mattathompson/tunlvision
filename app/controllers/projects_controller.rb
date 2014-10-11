class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :info, :inspiration, :destroy, :edit, :update]

  def show

  end

  def new
    @project = current_user.projects.new
  end

  def info

  end

  def inspiration

  end

  def create
    @project = current_user.projects.new create_params
    if @project.save!
      redirect_to @project, :flash => {:success => "Project successfully created!"}
    else
      redirect_to :back, :flash => {:failure => "Sorry. Something went wrong."}
    end
  end

  def edit

  end

  def update

    if @project.update_attributes! create_params
      redirect_to @project, :flash => {:success => "Project Successfully updated!"}
    else
      redirect_to :back, :flash => {:failure => "Sorry, somthing went wrong."}
    end
  end

  def destroy

    if @project.destroy!
      redirect_to root_path, :flash => {:success => "#{@project.title} was successfully removed!"}
    else
      redirect_to :back, :flash => {:failure => "Something went wrong."}
    end

  end

  private

  def create_params
    params.require(:project).permit(:title, :client, :description, :deadline, :client, :client_website_url, :client_description, :client_email)
  end

  def find_project
    @project = current_user.projects.find params[:id]
  end

end

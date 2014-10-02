class ProjectsController < ApplicationController


  def show
    @project = current_user.projects.find params[:id]
  end

  def new
    @project = current_user.projects.new
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
    @project = current_user.projects.find params[:id]
  end

  def update
    @project = current_user.projects.find params[:id]
    if @project.update_attributes! create_params
      redirect_to @project, :flash => {:success => "Project Successfully updated!"}
    else
      redirect_to :back, :flash => {:failure => "Sorry, somthing went wrong."}
    end
  end

  def destroy
    @project = current_user.projects.find params[:id]
    if @project.destroy!
      redirect_to root_path, :flash => {:success => "#{@project.title} was successfully removed!"}
    else
      redirect_to :back, :flash => {:failure => "Something went wrong."}
    end

  end

  private

  def create_params
    params.require(:project).permit(:title, :client, :description, :deadline)
  end

end

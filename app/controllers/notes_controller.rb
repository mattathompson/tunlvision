class NotesController < ApplicationController
  before_action :find_project

  def index

  end


  def show

  end


  def new
    @note = @project.notes.new
  end


  def edit

  end


  def create
    @note = @project.notes.new create_params
    if @note.save!
      redirect_to @project, :flash => {:success => "You created a note for #{@project.title}!"}
    else
      redirect_to :back, :flash => {:failure => "Sorry Something went wrong :("}
    end
  end


  def update

  end


  def destroy

  end

private

  def create_params
    params.require(:note).permit(:title, :content)
  end

  def find_project
    @project = current_user.projects.find params[:project_id]
  end


end

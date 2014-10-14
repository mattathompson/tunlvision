class ImageAttachmentsController < ApplicationController
  before_action :find_project

  def index

  end


  def show
    @image_attachment = @project.image_attachments.find params[:id]
  end


  def new
    @image_attachment = @project.image_attachments.new
  end


  def create
    @image_attachment = @project.image_attachments.new create_params
    if @image_attachment.save!
      redirect_to [@project, @deliverable, @image_attachment], :flash => {:success => "The Image was successfully added"}
    else
      redirect_to :back, :flash => {:failure => "Something went wrong :("}
    end
  end


  def edit
    @image_attachment = @project.image_attachments.find params[:id]
  end


  def update
    @image_attachment = @project.image_attachments.find params[:id]
    if params[:main] = true
      @project.set_main_as_false
    end

    if @image_attachment.update! create_params
      redirect_to @project
    else
      redirect_to :back
    end

  end


  def destroy

  end


  private


  def find_project
    @project = current_user.collaborations.find(params[:project_id])
    rescue
    @project = current_user.projects.find(params[:project_id])
  end


  def create_params
    params.require(:image_attachment).permit(:image, :title, :description, :deliverable_id, :main)
  end


end

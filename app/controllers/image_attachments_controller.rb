class ImageAttachmentsController < ApplicationController
  before_action :find_project, :find_deliverable

  def index

  end


  def show
    @image_attachment = @deliverable.image_attachments.find params[:id]
  end


  def new
    @image_attachment = @deliverable.image_attachments.new
  end


  def create
    @image_attachment = @deliverable.image_attachments.new create_params
    if @image_attachment.save!
      redirect_to @project, :flash => {:success => "The Image was successfully added"}
    else
      redirect_to :back, :flash => {:failure => "Something went wrong :("}
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

  def find_deliverable
    deliverables = @project.deliverables.find params[:deliverable_id]
    @deliverable = deliverables
  end

  def create_params
    params.require(:image_attachment).permit(:image)
  end


end

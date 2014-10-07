class StaticPagesController < ApplicationController

  def dashboard
    @projects = current_user.projects.order(:deadline).page params[:page]
  end

  def help
  end

  def about
  end

  def contact
  end




end

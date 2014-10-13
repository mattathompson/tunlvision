class StaticPagesController < ApplicationController

  def dashboard
    @projects = current_user.projects.text_search(params[:query]).ordered(params)
    @collaborations = current_user.collaborations.text_search(params[:query]).ordered(params)
  end

  def help
  end

  def about
  end

  def contact
  end




end

class StaticPagesController < ApplicationController

  def dashboard
    @projects = current_user.projects
  end

  def help
  end

  def about
  end

  def contact
  end




end

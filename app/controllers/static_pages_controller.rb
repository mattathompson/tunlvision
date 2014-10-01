class StaticPagesController < ApplicationController

  def dashboard
    @projects = current_user.projects

  end




end

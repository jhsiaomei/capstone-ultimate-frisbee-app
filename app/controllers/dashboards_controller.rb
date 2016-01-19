class DashboardsController < ApplicationController
  def index
    redirect_to "/dashboards/#{current_user.id}"
  end

  def show
    
  end
end

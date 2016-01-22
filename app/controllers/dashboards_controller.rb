class DashboardsController < ApplicationController
  def index
    redirect_to "/dashboards/#{current_user.id}"
  end

  def show
    user_events = current_user.events.where("start_datetime > current_timestamp")
    @user_events = user_events.order("start_datetime ASC").limit(2)
    @user_groups = current_user.groups
  end
end
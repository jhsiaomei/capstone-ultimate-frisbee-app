class UserEventsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user_event = UserEvent.create(
      user_id: current_user.id,
      event_id: params[:event_id],
      is_admin: false
      )
    flash[:alert] = "You have joined this event!"
    redirect_to "/events/#{params[:event_id]}"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

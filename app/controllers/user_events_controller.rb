class UserEventsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user_event = UserEvent.create(
      user_id: current_user.id,
      event_id: params[:event_id],
      )
  
    flash[:success] = "You joined this event!"
    redirect_to "/events"
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

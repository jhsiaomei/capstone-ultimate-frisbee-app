class Api::V1::UserGroupsController < ApplicationController
  def index
    user_groups = UserGroup.all
    render json: user_groups
  end
end

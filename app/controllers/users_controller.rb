class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all

    json_response(@users)
  end

  # POST /users
  def create
    # need to be updated to a signup method that will return a new JWT
    @user = User.create!(user_params)
    @user.update(avatar_url: url_for(@user.avatar)) if @user.avatar.attached?
    json_response(@user, :created)
  end

  private

  def user_params
    params.permit(
      :username,
      :email,
      :avatar,
      :password,
      :password_confirmation
    )
  end
end

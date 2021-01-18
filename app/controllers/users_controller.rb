class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # GET /users
  def index
    @users = User.all

    json_response(@users)
  end

  # POST /users
  def create
    user = User.create!(user_params)
    user.update(avatar_url: url_for(user.avatar)) if user.avatar.attached?
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
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

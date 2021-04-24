class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :create]

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    user = User.new email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation], organization: Current.user.organization

    if user.save
      flash[:notice] = "User successfully added to #{Current.user.organization.name}"
    else
      flash[:alert] = user.errors.full_messages[0]
    end

    render :index
  end

  private

  def user_params
    params.permit :email, :password, :password_confirmation
  end
end

class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])&.authenticate(session_params[:password])
    # Pene
    if @user
      flash[:notice] = "Welcome back #{@user.email} to #{@user.organization.name}"
      session[:user_id] = @user.id 
      redirect_to root_path
    else
      flash[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    render :new
  end

  private

  def session_params
    params.permit :email, :password
  end
end

class RegistrationsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    organization_uid = (0...6).map { ('a'..'z').to_a[rand(26)] }.join.upcase
    @organization = Organization.new name: organization_params[:name], uid: organization_uid
    @user = User.new(
      email: organization_params[:email], 
      password: organization_params[:password], 
      password_confirmation: organization_params[:password_confirmation], 
      admin: true
    )
    @user.organization = @organization

    if @organization.save && @user.save
      redirect_to root_path
      return
    elsif !@organization.errors.full_messages.empty?
      flash[:alert] = @organization.errors.full_messages[0] unless @organization.errors.full_messages.empty?
    elsif !@user.errors.full_messages.empty?
      @organization.destroy
      flash[:alert] = @user.errors.full_messages[0] unless @user.errors.full_messages.empty?
    end

    render :new
  end

  private

  def organization_params
    params.permit :name, :email, :password, :password_confirmation
  end
end


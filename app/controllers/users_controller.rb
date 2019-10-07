# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if !@user.valid?
        render :new
      else
        @user.save
        session[:user_id]=@user.id
        redirect_to factories_index_url
      end
  end

  def edit
    # binding.pry
    # @user = User.find_by_id(session[:user_id])
  end

  def update; end

  def destroy; end

  def index; end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :factory_id, :super_user, :password_confirmation)
  end
end

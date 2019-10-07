class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    if auth
      #facebook login
      @user = User.find_by(email: auth['info']['email'])
      
      if @user 
        
        session[:user_id]=@user.id
        redirect_to '/'
      else
        user = User.find_by_auth_or_create(auth)
        session[:user_id]=user.id
        redirect_to '/'
      end
    else
      @user = User.find_by(:email => params[:user][:email])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id]=@user.id
        redirect_to '/'
      else
        #error no account
        redirect_to signup_path
      end
    end
  end
    #@user = User.find_or_create_by(email: auth['info']['email'])
    # # session[:user_id] = @user.id
    # binding.pry
    # if @user.factory== nil 
    #   # please complete the data form
    #   binding.pry
    #   render 'users/new'
    # end
  def destroy
    reset_session
    redirect_to "/"
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end
end

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
        # redirect_to '/'
         
        if is_super_user?
           
          redirect_to factories_index_url
          
        else
           
          redirect_to equipment_index_url
        end
      else
         
        #error no account
        redirect_to signup_path
      end
    end
  end
    #@user = User.find_or_create_by(email: auth['info']['email'])
    # # session[:user_id] = @user.id
    #  
    # if @user.factory== nil 
    #   # please complete the data form
    #    
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

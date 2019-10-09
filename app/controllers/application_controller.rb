class ApplicationController < ActionController::Base
    helper_method :is_logged_in?
    helper_method :is_super_user?
    helper_method :current_user

    def is_logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by_id(session[:user_id])
    end
    
    def is_super_user?
       if current_user.super_user == true
        true
       else
        false
       end
    end

    def is_valid_user?
        @user = current_user
        if !is_logged_in? || @user == nil
          false
        else
          true
        end
    end
end

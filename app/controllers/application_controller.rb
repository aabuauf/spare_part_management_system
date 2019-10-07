class ApplicationController < ActionController::Base
    helper_method :is_logged_in?

    def is_logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by_id(session[:user_id])
    end
    
end

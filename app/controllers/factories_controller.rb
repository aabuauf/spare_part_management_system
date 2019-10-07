class FactoriesController < ApplicationController
  
  
  def index
    @user = current_user
    if !is_logged_in? || @user == nil
      redirect_to signin_url
    else
      @factory = @user.factory
      if params[:term]
        @equipment = Equipment.search_for_tag(params[:term],@factory.id) 
      else
        @equipment = @factory.equipment
    
      end
    end

  end

end

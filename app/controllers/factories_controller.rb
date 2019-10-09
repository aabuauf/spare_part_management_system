class FactoriesController < ApplicationController
  
  
  def index
  
    if is_valid_user? 
      if is_super_user?
      @factories = Factory.all
      else
        redirect_to equipment_url
      end
    else
      
      redirect_to signin_url
    end

  end

end

class FactoriesController < ApplicationController
  
  
  def index
    
    if is_valid_user?
      
      @factories = Factory.all
      
    else
      
      redirect_to signin_url
    end

  end

end

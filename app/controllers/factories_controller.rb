class FactoriesController < ApplicationController
  
  
  def index
    @user = current_user
    if is_valid_user?
      redirect_to signin_url
    else
      @factories = Factory.all
    end

  end

end

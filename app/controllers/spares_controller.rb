class SparesController < ApplicationController
  
  
def show
  @user = current_user
  if  !is_logged_in? || @user == nil
    redirect_to signin_url
  else
    @spare = Spare.find_by_id(params[:id])
    @equipment = @spare.equipment
  end
end


def new
  binding.pry

end
end

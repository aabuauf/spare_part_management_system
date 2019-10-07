class EquipmentController < ApplicationController
  
  
def show
    if is_logged_in?
        @eq = Equipment.find_by_id(params[:id])
        @spares = @eq.spares
        
    else
        redirect_to signin_url
    end
end
end

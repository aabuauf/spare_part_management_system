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
  @spare= Spare.new
  @user = current_user
  @eq = @user.factory.equipment
 
end

def create

@user = current_user
if  !is_logged_in? || @user == nil
  redirect_to signin_url
else
  @spare = Spare.new(params_spare)
  @spare.factory = @user.factory
  binding.pry
  params[:spare][:equipment].each do |e|
    @spare.equipment << Equipment.find_by_tag_no(e)
  end
  @spare.boms.each do |s|
    s.qty_installed = 1
  end
  @spare.save
  binding.pry
  @equipment = @spare.equipment
  redirect_to spare_path(@spare)
end

end

private
def params_spare
  params.require(:spare).permit(:code, :description, :manufacture, :part_no, :qty)
end
end

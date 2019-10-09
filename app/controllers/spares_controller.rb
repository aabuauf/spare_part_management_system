class SparesController < ApplicationController
  before_action :set_user
  
def show
  
  if  !is_valid_user?
    redirect_to signin_url
  else
    @spare = Spare.find_by_id(params[:id])
    @equipment = @spare.equipment
  end
end


def new
  @spare= Spare.new
  
  @eq = @user.factory.equipment
 
end

def create


if  !is_valid_user?
  redirect_to signin_url
else
  @spare = Spare.new(params_spare)
  @spare.factory = @user.factory
  params[:spare][:equipment].each do |e|
    @spare.equipment << Equipment.find_by_tag_no(e)
  end
  @spare.boms.each do |s|
    s.qty_installed = 1
  end
  @spare.save
  @equipment = @spare.equipment
  redirect_to spare_path(@spare)
end

end

private
def params_spare
  params.require(:spare).permit(:code, :description, :manufacture, :part_no, :qty)
end

def set_user
  @user = current_user
end
end

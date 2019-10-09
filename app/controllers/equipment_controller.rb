class EquipmentController < ApplicationController
    skip_before_action :verify_authenticity_token
  
def show
    if is_logged_in?
        @eq = Equipment.find_by_id(params[:id])
        @spares = @eq.spares
        
    else
        redirect_to signin_url
    end
end

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

  def new
    @equipment=Equipment.new
  end

  def create
   
    if is_logged_in? && is_super_user?
        @equipment = Equipment.new(equipment_params)
        if !@equipment.valid?
        render :new
        else
        @equipment.save
        redirect_to  factory_equipment_url(@equipment.factory,@equipment)
        
        end
    else
        #error
        redirect_to signin_url
    end
  end
  def edit
    @equipment = Equipment.find_by_id(params[:id])
  end

  def update
    if is_logged_in? && is_super_user?
        @equipment = Equipment.find_by_id(params[:id])
        if !@equipment.valid?
        render :new
        else
        @equipment.update(equipment_params)
        redirect_to  factory_equipment_url(@equipment.factory,@equipment)
        
        end
    else
        #error
        redirect_to signin_url
    end
  end
  def destroy
    binding.pry
    if is_logged_in? && is_super_user?
        @equipment = Equipment.find_by_id(params[:id])
        @equipment.destroy
        binding.pry
        redirect_to  factory_equipment_index_url(@equipment.factory)
        
        
    else
        #error
        redirect_to signin_url
    end
  end
  private

  def equipment_params
    params.require(:equipment).permit(:tag_no, :manufacture, :factory_id)
  end
end

class EquipmentController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :get_equipment , only: [:show, :edit, :update, :destroy]
def show
    if is_valid_user?
        
        @spares = @equipment.spares
        
    else
        redirect_to signin_url
    end
end

  def index
      
    if is_valid_user?
   
      @factory = @user.factory
      if params[:term]
        @equipment = Equipment.search_for_tag(params[:term],@factory.id) 
      else
        @equipment = @factory.equipment
    
      end
    else
        redirect_to signin_url
    end

  end

  def new
    @equipment=Equipment.new
  end

  def create
   
    if is_valid_user? && is_super_user?
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
    
  end

  def update
    if is_valid_user? && is_super_user?
       
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
      
    if is_valid_user? && is_super_user?
       
        @equipment.destroy
          
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

  def get_equipment
    @equipment = Equipment.find_by_id(params[:id])
  end
end

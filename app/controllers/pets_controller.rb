class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
    raise
  end

  def create
    @pet = Pet.new(params_pet[:pet])
    @pet.user = current_user
    @pet.save
  end

  def show
    
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private
  def params_pet
    params.require(:pet).permit(:name, :adopted, :species, :breed, :user_id)
  end
  
end

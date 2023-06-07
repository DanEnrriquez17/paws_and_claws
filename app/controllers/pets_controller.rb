class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
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
    @pet.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pets_path, status: :see_other
  end

  def update
    if @pet.update(params_pet[:pet])
      redirect_to pet_path(@pet)
      else
        redirect_to edit_pet_path(@pet), status: :unprocessable_entity
    end
  end

  private
  def params_pet
    params.require(:pet).permit(:name, :adopted, :species, :breed, :user_id)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end

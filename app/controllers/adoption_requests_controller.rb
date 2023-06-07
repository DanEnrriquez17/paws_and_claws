class AdoptionRequestsController < ApplicationController
  before_action :set_request, only: :destroy
  before_action :set_pet, only: [:new, :create, :index]

  def index
    # we need to set an instance variables that pulls all of the requests
    # for the current pet owned by the current_user
    # likely will need a if statement to determine if current user has the right to view requests
    # or i might need this if statement to show a "view requests" button on 
    if @pet.user == current_user
      @requests = @pet.adoption_requests
    else
      @requests = []
      @notification = "you do not own this pet"
    end
  end

  def new
    @request = AdoptionRequest.new
  end

  def create
    @request = AdoptionRequest.new(request_params)
    @request.pet = @pet
    if @request.save
      redirect_to pet_path(@pet)
      # we should add an alert that indicates request for adoption has been submitted
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def request_params
    params.require(:request).permit(:status, :user_id, :pet_id)
  end

  def set_request
    @request = AdoptionRequest.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

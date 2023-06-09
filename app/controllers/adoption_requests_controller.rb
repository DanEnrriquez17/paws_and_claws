class AdoptionRequestsController < ApplicationController
  before_action :set_request, only: [:destroy, :accept]
  before_action :set_pet, only: [:new, :create, :index, :accept, :destroy]
  before_action :authenticate_user!, only: [:index]

  def index
    # we need to set an instance variables that pulls all of the requests
    # for the current pet owned by the current_user
    # likely will need a if statement to determine if current user has the right to view requests
    # or i might need this if statement to show a "view requests" button on
    if @pet.user == current_user
      if @pet.adopted == true
        @requests = @pet.adoption_requests.where(status: "accepted")
      else
        @requests = @pet.adoption_requests
      end
    else
      redirect_to root_path, alert: "you do not own this pet"
    end
  end

  def new
    @request = AdoptionRequest.new
  end

  def create
    @request = AdoptionRequest.new
    @request.pet = @pet
    @request.user = current_user
    if @request.save
      redirect_to pet_path(@pet), alert: "#{@pet.name} requested for adoption" #this should redirect to user's profile
      # we should add an alert that indicates request for adoption has been submitted
    else
      # I don't know if the render partial will work
      redirect_to pet_path(@pet), status: :unprocessable_entity
    end
  end

  def accept

    # change all other requests statuses to rejected
    # to do that, first create requests variable that filters out the accepted
    @other_requests = @pet.adoption_requests.each { |request| request != @request }
    # then set the status of all other requests to declined
    @other_requests.each { |request| request.update(status: "declined") }
    # change status of request to accepted
    @request.status = "accepted"
    @request.save!
    # change status of pet
    @pet.adopted = true
    @pet.save!
    redirect_to @pet, alert: "#{@pet.name} has a new owner"
  end

  def destroy
    @request.destroy
    redirect_to @pet, alert: "you withdrew your adoption request for #{@pet.name}"
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

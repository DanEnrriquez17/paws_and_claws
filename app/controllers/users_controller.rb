class UsersController < ApplicationController
  def myrequests
    @my_requests = current_user.adoption_requests
  end

  def mypets
    @my_pets = current_user.owned_pets
  end
end

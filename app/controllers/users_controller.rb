class UsersController < ApplicationController
  def requests
    @pets = current_user.owned_pets
  end
end

class UsersController < ApplicationController
  def myrequests
    @my_requests = current_user.adoption_requests
  end
end

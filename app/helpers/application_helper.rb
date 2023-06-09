module ApplicationHelper
  def pet_requests_status(pet)
    if current_user.has_an_active_request_with_this_(pet).status == "pending"
      "Adoption request pending"
    elsif current_user.has_an_active_request_with_this_(pet).status == "accepted"
      "Not available for adoption"
    else
      "Adoption request declined"
    end
  end
end

class HomeController < ApplicationController

  def index
    if (user_signed_in?)
      @userOrganisation = Organisation.where(id: current_user.organisation_id).first
    else
      @userOrganisation = nil
    end

  end
end

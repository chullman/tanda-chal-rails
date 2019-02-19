class HomeController < ApplicationController

  def index

    @timezone = "Brisbane"

    @shift = Shift.new

    if (user_signed_in?)
      @userOrganisation = Organisation.where(id: current_user.organisation_id).first

      if (!(@userOrganisation.nil?))
        @allUsersAtOrganisation = User.where(organisation_id: @userOrganisation.id).all

        @shiftsForAllUsersAtOrg = Hash.new

        @allUsersAtOrganisation.each do |userAtOrganisation|
          @shiftsForAllUsersAtOrg[userAtOrganisation.id] = Shift.where(user_id: userAtOrganisation.id).all
        end

      else
        @allUsersAtOrganisation = nil  
      end
    else
      @userOrganisation = nil
      @allUsersAtOrganisation = nil
    end

  end
end

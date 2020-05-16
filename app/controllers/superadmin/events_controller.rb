class Superadmin::EventsController < ApplicationController
    before_action :check_if_superadmin






    private

    def check_if_superadmin
        current_user.is_superadmin == true
    end
end

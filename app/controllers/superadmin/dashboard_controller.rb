class Superadmin::DashboardController < ApplicationController
#    before_action :authenticate_user!
    before_action :check_if_superadmin

    def index
        
    end
  

    private
    
    def check_if_superadmin
        authenticate_user!

        if !current_user.superadmin
            flash[:danger] = "Accès refusé"
            redirect_to root_path      
        end
    end

end

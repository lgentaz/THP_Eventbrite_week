class Superadmin::UsersController < ApplicationController
    before_action :check_if_superadmin

    def show
        @user = User.find(params[:id])
        if !current_user?(@user.id)
          flash[:error] = "Ce n'est pas ton profil"
          redirect_to root_path
        end
      end
    
      def edit
        @user = User.find(params[:id])
        if !current_user?(@user.id)
          flash[:error] = "Ce n'est pas ton profil"
          redirect_to root_path
        end
      end
    
      def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
          flash[:success] = "Bravo! Ta modification a été enregistrée."
          redirect_to user_path(@user.id)
        else
          messages = []
          if @user.errors.any?
            @user.errors.full_messages.each do |message|
              messages << message
            end
            flash[:danger] = "Impossible de modifier le profil: #{messages.join(" ")}"
          end
          redirect_to edit_user_path
        end 
      end
    
      def user_params
        params.require(:user).permit(:first_name, :last_name, :description, :avatar)
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

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(current_user.id)
    puts @user
    puts current_user.id
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
    params.require(:user).permit(:first_name, :last_name, :description)
  end
  

end

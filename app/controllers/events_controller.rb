class EventsController < ApplicationController
  def index

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new(title: params[:title], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price], location: params[:location], admin: current_user)
  end

  def create
    @event = Event.new(title: params[:title], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price], location: params[:location], admin: current_user)
    if @event.save
      flash[:success] = "Bravo! Ton évènement créé."
      redirect_to root_path
    else
      messages = []
      if @event.errors.any?
        @event.errors.full_messages.each do |message|
          messages << message
        end
        flash[:danger] = "Impossible de créer l'évènement': #{messages.join(" ")}"
      end
      redirect_to new_event_path
    end    

  end

  def edit
    
  end

  def event_params
    params.require(:events).permit(:title, :start_date, :duration, :description, :price, :location, :admin)
  end


end

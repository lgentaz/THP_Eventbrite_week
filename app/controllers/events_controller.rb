class EventsController < ApplicationController
  def index

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Bravo! Ton évènement créé."
      redirect_to event_path(@event.id)
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

  def event_params
    params.require(:events).permit(:title, :start_date, :duration, :description, :price, :location, :admin_id)
  end


end

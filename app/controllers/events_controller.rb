class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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

  def edit
    @event = Event.find(params[:id])
    if !current_user?(@event.admin_id)
      flash[:danger] = "Ce n'est pas ton évènement."
      redirect_to root_path
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params_update)
      flash[:success] = "Bravo! Ta modification a été enregistrée."
      redirect_to events_path(@event.id)
    else
      messages = []
      if @event.errors.any?
        @event.errors.full_messages.each do |message|
          messages << message
        end
        flash[:danger] = "Impossible de modifier l'évènement': #{messages.join(" ")}"
      end
      redirect_to edit_event_path
    end 
  end

  def destroy
    @event = Event.find(params[:id])
    if !current_user?(@event.admin_id)
      flash[:danger] = "Hé hé c'est pas ton potin ça!!!"
      redirect_to root_path
    else
      @event.destroy
      flash[:success] = "Supprimé avec succès!"
      redirect_to root_path
    end

  end

  def event_params
    params.require(:events).permit(:title, :start_date, :duration, :description, :price, :location, :admin_id)
  end

  def event_params_update
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location, :admin_id)
  end


end

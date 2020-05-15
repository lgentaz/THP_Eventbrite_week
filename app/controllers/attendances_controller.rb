class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @event = Event.find(params[:event_id])
    if !current_user?(@event.admin_id)
      flash[:danger] = "Ce n'est pas ton évènement."
      redirect_to root_path
    end
  end

  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    @guest = User.find(current_user.id)
    @amount = @event.price * 100
    
    if is_free?(@event)
      @attendance = Attendance.new(guest: @guest, event: @event, stripe_customer_id: 0)
      if @attendance.save
        flash[:success] = "Tu es inscrit(e) à #{@event.title}."
        redirect_to event_path(@event.id)
      else
        messages = []
        if @event.errors.any?
          @event.errors.full_messages.each do |message|
            messages << message
          end
          flash[:danger] = "Impossible de t'inscrire': #{messages.join(" ")}"
        end
        redirect_to new_event_path
      end   
    
    else
      @customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      @charge = Stripe::Charge.create({
        customer: @customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

      @attendance = Attendance.new(guest: @guest, event: @event, stripe_customer_id: @customer.id)
      if @attendance.save
        flash[:success] = "Tu es inscrit(e) à #{@event.title}."
        redirect_to event_path(@event.id)
      else
        messages = []
        if @event.errors.any?
          @event.errors.full_messages.each do |message|
            messages << message
          end
          flash[:danger] = "Impossible de t'inscrire': #{messages.join(" ")}"
        end
        redirect_to new_event_path
      end   
    end 

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path


  end
  

end

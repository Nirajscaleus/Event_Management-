class EventsController < ApplicationController
  def index
    if user_signed_in?
     @events = current_user.events
    end 
  end

  def show
     @event = Event.find(params[:id])
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to @event
    else 
       render :new
    end
  end
   
  def edit
    @event = Event.find(params[:id])
   end

  def update
   @event = Event.find(params[:id])
   if @event.update(events_params)
    redirect_to @event
   else
    render :edit, status: :unprocessable_entity
   end
  end

  def destroy

    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def events_params
    params.require(:event).permit(:name,:date,:location ,:description, :user_id)
  end
end

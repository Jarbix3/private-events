class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]
  def index
    @events = Event.all.order("created_at DESC")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Event was successfully created." }
      else
        render :new, status: :unprocessable_entity, notice: "Event was not created."
      end
    end
  end

  def edit
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: "Event was successfully deleted."
  end
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path, notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def join
    attendance = current_user.attendances.build(attended_event_id: params[:id])
    respond_to do |format|
      if attendance.save
        format.html { redirect_to root_path, notice: "You have joined the event." }
      else
        format.html { redirect_to event_path, alert: attendance.errors.full_messages.to_sentence }
      end
    end
  end

   private

   def set_event
    @event = Event.find(params[:id])
   end

  def event_params
    params.require(:event).permit(:title, :description, :location, :category, :date)
  end
end

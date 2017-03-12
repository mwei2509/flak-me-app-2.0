class EventsController < ApplicationController

  def create
    event=Event.new(event_params)
    event.group=Group.find_by(slug: params[:group_slug])
    event.user = current_user
    if event.valid?
      event.save
      redirect_to event.group
    else
      flash[:error]="Error"
      redirect_to event.group
    end
  end

  def rsvp
    event = Event.find(params[:id])
    @group=Group.find_by(slug: params[:group_slug])
    rsvp=Rsvp.rsvp(current_user, event)
    redirect_to @group
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_start, :event_end, :description)
  end
end

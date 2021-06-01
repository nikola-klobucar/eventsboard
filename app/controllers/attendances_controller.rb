class AttendancesController < ApplicationController
    before_action :set_event
    before_action :authenticate_user!
    skip_after_action :verify_authorized

    def create
        @attendace = @event.attendances.where(attendee: current_user).first_or_create

        if @attendace.save
            flash[:notice] = "You have regitsared successfully to attend this event"
            redirect_to user_path(current_user)
        end
    end



    private

        def set_event
            @event = Event.friendly.find(params[:event_id])
        end
end

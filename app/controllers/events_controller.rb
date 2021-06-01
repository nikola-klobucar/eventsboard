class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    # before_action :authorize_owner!, only: [:edit, :update, :destroy]

    def index
        if params[:query].present?
            @events = Event.search(params[:query])
        else
            @events = Event.order(created_at: :desc)
        end
        @events = Event.order(created_at: :desc)
        authorize @events, :index? # Ovo zamjenjuje before_action: :authorize_owner!
        # zbog gem-a "Pundit" u application_controler.rb
        @categories = Category.order(:name)
    end

    def show
        authorize @event, :show?
        @comment = Comment.new
        @comment.event_id = @event.id
    end

    def new
        @event = Event.new
        authorize @event, :new?
    end

    def create
        @event = Event.new(event_params)
        @event.organizer = current_user

        authorize @event, :create?
        if @event.save
            flash[:notice] = "Event created!"
            redirect_to @event
        else
            flash.now[:alert] = "Event not created!"
            render "new"
        end
    end

    def edit
        authorize @event, :edit?
    end

    def update
        authorize @event, :update?
        if @event.update(event_params)
            flash[:notice] = "Event updated"
            redirect_to @event
        else
            flash.now[:alert] = "Event not updated!"
            render "edit"
        end
    end

    def destroy
        authorize @event, :destroy?
        @event.destroy
        flash[:alert] = "Event deleted successfully!"
        redirect_to events_url
    end


    private

    def set_event
        @event = Event.friendly.find(params[:id])

        # authorize @event

    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The page you just requested does not exist."
        redirect_to events_url
    end

    def event_params
        params.require(:event).permit(:title, :description, :start_date, :end_date,
             :venue, :location, :image, :category_id)
    end

    # def authorize_owner!
    #     authenticate_user!
    #
    #     unless @event.organizer == current_user
    #         flash[:alert] = "You do not have enough premission to '#{action_name}' the '#{@event.title.upcase}' event"
    #         redirect_to events_path
    #     end
    # end
end

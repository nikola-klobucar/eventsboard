class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    skip_after_action :verify_authorized

    def show

    end



    private

    def set_user
        @user = User.find(params[:id])
    end
end

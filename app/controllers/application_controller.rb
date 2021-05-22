class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    after_action :verify_authorized, unless: :devise_controller?

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    private

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) do |user|
                user.permit(:email, :password, :password_confirmation,
                :first_name, :last_name, :username, :organization_name)
            end
            devise_parameter_sanitizer.permit(:account_update) do |user|
                user.permit(:email, :password, :password_confirmation, :current_password,
                :first_name, :last_name, :username, :organization_name)
            end
        end

        def user_not_authorized
            flash[:alert] = "You are not authorized to perform this action!"
            redirect_to(request.referrer || root_path)
        end
end

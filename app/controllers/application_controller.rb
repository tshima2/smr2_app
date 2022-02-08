class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :under_statics_top?
    before_action :configure_permitted_parameters, if: :devise_controller?

    def under_statics_top?
        (controller_name == "statics")? true : false
    end

    def check_guest_user
        if current_user.guest?
          flash[:alert] = "guest-user allowed only viewing."
          redirect_to request.referer 
        end 
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

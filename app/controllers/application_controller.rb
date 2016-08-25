require "materialize_renderer"

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    rescue_from ActiveRecord::RecordNotFound do
        flash[:warning] = 'Resource not found.'
        redirect_back_or root_path
    end

    def redirect_back_or(path)
        redirect_to request.referer || path
    end

    def after_sign_in_path_for(resource_or_scope)
        # your_path
        user_dashboard_path(current_user)
    end

    def after_sign_out_path_for(resource_or_scope)
        # your_path
        new_user_session_path
    end

    def after_update_path_for(resource)
        user_dashboard_path(current_user)
    end

end

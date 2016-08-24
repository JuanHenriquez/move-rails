class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource_or_scope)
        # your_path
        user_path(current_user)
    end

    def after_sign_out_path_for(resource_or_scope)
        # your_path
        new_user_session_path
    end

    def after_update_path_for(resource)
        user_path(resource)
    end

end

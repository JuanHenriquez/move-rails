class UsersController < ApplicationController

    before_action :set_user, :only => [:show]
    before_action :authenticate_user!
    before_action :user_owner, :only => [:show]
    # User a special layout for the user feed.
    layout "user-feed", :only => [:show, :dashboard]

    # GET - Show a user.
    def dashboard
        @user = User.find(params[:user_id])
    end

    def show

    end

    private


    def set_user
        @user = User.find(params[:id])
    end

    def user_owner
        if current_user != @user
            flash[:danger] = "You don't have permissions to do that."
            redirect_to user_dashboard_path(current_user)
        end
    end

end

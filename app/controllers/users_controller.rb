class UsersController < ApplicationController

    # User a special layout for the user feed.
    layout "user-feed", :only => [:show]

    # GET - Show a user.
    def show
        @user = User.find(current_user)
    end

end

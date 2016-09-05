class UsersController < ApplicationController

    before_action :set_user, :only => [:show]
    before_action :authenticate_user!
    before_action :user_owner, :only => [:show]
    # User a special layout for the user feed.
    layout "user-feed", :only => [:show, :dashboard]

    # GET - Show a user.
    def dashboard
        @user = User.find(params[:user_id])
        @posts = Post.where(:user_id => @user.id).order(created_at: :desc)
        @photos = Photo.where(:user_id => @user.id).order(picture_updated_at: :desc)
    end

    def show

    end

end

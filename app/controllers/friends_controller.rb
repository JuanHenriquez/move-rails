class FriendsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_user
    before_action :user_owner

    layout "user-feed"

    def index
        @friends = current_user.friends
    end

    def pending
        @pending_list = current_user.pending_friends
        @requested_list = current_user.requested_friends
    end

    def search
        search_result = params[:search]
        @results = User.search(search_result).to_a.keep_if { |user|
            user != current_user
        }

        @results
    end

    def send_request
        friend = User.find(params[:friend_id])
        Friendship.request(current_user, friend)
        flash[:success] = "Your request has been send successfully!"
        redirect_to user_dashboard_path(current_user)
    end

    def create
        friend = User.find(params[:friend_id])
        Friendship.accept(current_user, friend)
        flash[:success] = "You and #{ friend.name } are friends!"
        redirect_to user_dashboard_path(current_user)
    end

    def destroy
        friend = User.find(params[:friend_id])
        Friendship.delete(current_user, friend)
        flash[:danger] = "Friend deleted!"
        redirect_to user_dashboard_path(friend)
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

end

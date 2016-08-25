class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_mailbox
    before_action :get_conversation, except: [:index]
    before_action :get_friend, only: [:show]
    layout "user-feed"

    def index
        # Get all the conversations for the current user.
        @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 20)
    end

    def show

    end

    private

    def get_mailbox
        @mailbox ||= current_user.mailbox
    end

    def get_conversation
        @conversation ||= @mailbox.conversations.find(params[:id])
    end

    def get_friend
        friend_id = @mailbox.conversations.find(2).receipts.where("receiver_id != ?", current_user.id).take.receiver_id
        @friend = User.find(friend_id)
    end
end

class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_mailbox, only: [:index, :show, :destroy]
    before_action :get_conversation, except: [:index, :create]
    before_action :get_friend, only: [:show]
    layout "user-feed"

    def index
        # Get all the conversations for the current user.
        @conversations = @mailbox.conversations.paginate(page: params[:page], per_page: 20)
    end

    def show

    end

    def create
        friend = User.find(params[:friend_id])
        conversation = current_user.send_message(friend, params[:message], params[:subject]).conversation
        redirect_to user_conversation_path(current_user, conversation)
    end

    def destroy
        friend = User.find(params[:friend_id])
        current_user.mark_as_deleted(@conversation)
        friend.mark_as_deleted(@conversation)
        flash[:danger] = 'Conversation was deleted!'
        redirect_to user_conversations_path
    end

    private

    def get_mailbox
        @mailbox ||= current_user.mailbox
    end

    def get_conversation
        @conversation ||= @mailbox.conversations.find(params[:id])
    end

    def get_friend
        friend_id = @mailbox.conversations.find(@conversation.id).receipts.where("receiver_id != ?", current_user.id).take.receiver_id
        @friend = User.find(friend_id)
    end
end

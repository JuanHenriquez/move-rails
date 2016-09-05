class Photos::PhotoCommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_user
    before_action :user_owner, :only => [:update, :destroy]

    def create
        comment = Photo::PhotoComment.create(photo_id: params[:photo_id], user_id: current_user.id, text: params[:text])

        if comment.save
            flash[:success] = "Your comment was posted!"
            redirect_to(:back)
        else
            flash[:danger] = "Sorry, something is wrong :("
            redirect_to(:back)
        end
    end

    def update

        comment = Photo::PhotoComment.find(params[:id])
        if comment.update(photo_id: params[:photo_id], user_id: current_user.id, text: params[:text])
            flash[:success] = "Comment update!"
            redirect_to(:back)
        else
            flash[:danger] = "Sorry, something is wrong."
            redirect_to(:back)
        end

    end

    def destroy

        comment = Photo::PhotoComment.find(params[:id])
        comment.destroy!
        flash[:danger] = "Comment deleted."
        redirect_to(:back)

    end

end

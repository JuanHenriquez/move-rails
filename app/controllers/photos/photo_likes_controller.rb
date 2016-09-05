class Photos::PhotoLikesController < ApplicationController

    def create
        photo = Photo.find(params[:photo_id])

        has_dislike = Photo::PhotoDislike.where(user_id: current_user.id, photo_id: photo.id)
        has_like = Photo::PhotoLike.where(user_id: current_user.id, photo_id: photo.id)

        if has_dislike.count > 0
            has_dislike.take.destroy
        end

        if has_like.count > 0
            redirect_to(:back) and return false
        else
            like = Photo::PhotoLike.create(photo_id: photo.id, user_id: current_user.id)

            if like.save
                flash[:success] = "You like that post!"
                redirect_to(:back) and return true
            else
                redirect_to(:back) and return false
            end
        end
    end

end

class Photos::PhotoDislikesController < ApplicationController

    def create
        photo = Photo.find(params[:photo_id])

        has_dislike = Photo::PhotoDislike.where(user_id: current_user.id, photo_id: photo.id)
        has_like = Photo::PhotoLike.where(user_id: current_user.id, photo_id: photo.id)

        if has_like.count > 0
            has_like.take.destroy
        end

        if has_dislike.count > 0
            redirect_to(:back)
        else
            dislike = Photo::PhotoDislike.create(photo_id: photo.id, user_id: current_user.id)

            if dislike.save
                flash[:success] = "You dislike that post!"
                redirect_to(:back)
            else
                redirect_to(:back)
            end
        end
    end

end

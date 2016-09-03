class Posts::PostDislikesController < ApplicationController

    def create
        post = Post.find(params[:post_id])

        has_dislike = Post::PostDislike.where(user_id: current_user.id, post_id: post.id)
        has_like = Post::PostLike.where(user_id: current_user.id, post_id: post.id)

        if has_like.count > 0
            has_like.take.destroy
        end

        if has_dislike.count > 0
            redirect_to(:back)
        else
            dislike = Post::PostDislike.create(post_id: post.id, user_id: current_user.id)

            if dislike.save
                flash[:success] = "You dislike that post!"
                redirect_to(:back)
            else
                redirect_to(:back)
            end
        end
    end

end

class Posts::PostLikesController < ApplicationController

    def create
        post = Post.find(params[:post_id])

        has_dislike = Post::PostDislike.where(user_id: current_user.id, post_id: post.id)
        has_like = Post::PostLike.where(user_id: current_user.id, post_id: post.id)

        if has_dislike.count > 0
            has_dislike.take.destroy
        end

        if has_like.count > 0
            redirect_to(:back) and return false
        else
            like = Post::PostLike.create(post_id: post.id, user_id: current_user.id)

            if like.save
                flash[:success] = "You like that post!"
                redirect_to(:back) and return true
            else
                redirect_to(:back) and return false
            end
        end
    end

end

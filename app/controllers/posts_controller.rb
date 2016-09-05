class PostsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_user
    before_action :user_owner, :only => [:edit, :update, :destroy]

    # POST /users/:user_id/posts
    def create
        @post = Post.new(:text => params[:text])
        @post.user = @user

        if @post.save
            flash[:success] = "Post was successfully created!"
            redirect_to user_dashboard_path(current_user)
        else
            flash[:danger] = "Sorry, the post could not be created."
            redirect_to user_dashboard_path(current_user)
        end
    end

    # PUT /users/:user_id/posts/:id
    def update
        post = Post.find(params[:id])
        if post.update(user_id: current_user.id, text: params[:text])
            flash[:success] = "Post update!"
            redirect_to(:back)
        else
            flash[:danger] = "Sorry, something is wrong."
            redirect_to(:back)
        end
    end

    # DELETE /users/:user_id/posts/:id
    def destroy

        post = Post.find(params[:id])
        post.destroy!
        flash[:danger] = "Post deleted."
        redirect_to(:back)

    end

end

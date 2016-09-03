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

    # GET /users/:user_id/posts/:id/edit
    def edit
    end

    # PUT /users/:user_id/posts/:id
    def update
    end

    # DELETE /users/:user_id/posts/:id
    def destroy

    end

end

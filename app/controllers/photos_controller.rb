class PhotosController < ApplicationController

    before_action :authenticate_user!
    before_action :set_user
    before_action :user_owner, :only => [:edit, :update, :destroy]

    # POST /users/:user_id/photos
    def create
        @photo = Photo.new(:picture => params[:picture],:text => params[:text])
        @photo.user = @user

        if @photo.save
            flash[:success] = "Photo was successfully created!"
            redirect_to user_dashboard_path(current_user)
        else
            flash[:danger] = "Sorry, the photo could not be created."
            redirect_to user_dashboard_path(current_user)
        end
    end

    # PUT /users/:user_id/posts/:id
    def update
        photo = Photo.find(params[:id])
        if photo.update(user_id: current_user.id, text: params[:text], picture: params[:picture])
            flash[:success] = "Photo update!"
            redirect_to(:back)
        else
            flash[:danger] = "Sorry, something is wrong."
            redirect_to(:back)
        end
    end

    # DELETE /users/:user_id/posts/:id
    def destroy

        photo = Photo.find(params[:id])
        photo.destroy!
        flash[:danger] = "Photo deleted."
        redirect_to(:back)

    end

end

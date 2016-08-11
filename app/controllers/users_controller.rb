class UsersController < ApplicationController

    # User a special layout for the user feed.
    layout "user-feed", :only => [:show]

    # GET - Show a user.
    def show
        @user = User.find(params[:id])
    end

    # GET - Show template to create a user.
    def new
        @user = User.new
    end

    # POST - Create a user.
    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Welcome to move #{user_params[:name]}"
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages[0]
            render 'new'
        end
    end

    # GET - Show template to edit a user.
    def edit
    end

    # PUT - Update a user.
    def update
    end

    # DELETE - Delete a user.
    def delete
    end

    # GET - Show Login template.
    def login
        @user = User.new
    end

    def auth_local
        @user = User.find_by_email(params[:user][:email])

        if (@user != nil)
            if (@user.password == params[:user][:password])
                redirect_to user_path(@user)
            else
                flash[:error] = "Your enter a wrong password."
                redirect_to root_path
            end
        else
            flash[:error] = "This user doesn't exists."
            redirect_to root_path
        end

    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :email, :tel, :country, :user_picture)
    end
end

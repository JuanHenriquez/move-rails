class UsersController < ApplicationController

    # GET - Show a user.
    def show
    end

    # GET - Show template to create a user.
    def new
        @user = User.new
    end

    # POST - Create a user.
    def create
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
        @user = User.find_by_name(params[:user][:name])

        if (@user != nil)
            if (@user.password == params[:user][:password])
                redirect_to user_path(@user)
            else
                redirect_to root_path
            end
        else
            redirect_to root_path
        end
    end

    

end

class UsersController < ApplicationController

    # GET - Show a user.
    def show
    end

    # GET - Show template to create a user.
    def new
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
    end

end

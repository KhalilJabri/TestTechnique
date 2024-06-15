class UsersController < ApplicationController

    def login
        user = User.find_by(username: params[:user])
        if user 
            redirect_to '/acceuil'
        end
    end

    def acceuil
        user = User.find_by(id: params[:xx])
        @user1 = user
    end

    def adminPage
        
    end

    def loginUser
        @user = User.find_by(username: params[:user][:username])
        if @user 
            redirect_to acceuil_path(xx: @user)
        end

    end
end

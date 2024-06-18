class UsersController < ApplicationController

    def login
        # @user = User.new
        # user = User.find_by(username: params[:user])
        # if user 
        #     redirect_to '/acceuil'
        # end
    end
    
    def loginUser
        # debugger
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            flash[:notice] = "Logged in successfully"
            session[:user_id] = user.id
            if user.role == "admin"
                redirect_to adminPage_path
            else
                redirect_to acceuil_path
            end
        else
            flash.now[:alert] = "Invalid username or password"
            redirect_to ''
        end
    end

    def signup
        if session[:user_id]
            userRole = User.find(session[:user_id])
            if userRole.role == "admin"
                # debugger
                # redirect_to signup_path
            else
                redirect_to acceuil_path
            end
        else
            redirect_to root_path
        end
    end
    
    # def logout
    # end
    
    def logoutPage
        session[:user_id] = nil
        reset_session
        # debugger
        cookies.delete('_test_tech_session')
        flash[:notice] = "Logged out successfully"
        redirect_to root_path
    end

    def acceuil
        if session[:user_id]
            # user = User.find_by(id: params[:xx])
            if params[:ip].present?
                shodan_service = ShodanService.new("aOjRCkLJgA2CwJgG3QnS0oylO7b0MLTS")
                @data = shodan_service.search_ip(params[:ip])
                # render json: @data
            else
                @data = nil
            end
        else
            redirect_to root_path
        end
    end

    # def shodanSearch
    #     if params[:ip].present?
    #         # debugger
    #         shodan_service = ShodanService.new("aOjRCkLJgA2CwJgG3QnS0oylO7b0MLTS")
    #         @data = shodan_service.search_ip(params[:ip])
    #         # @ports = @data["ports"] if @data
    #         # @ports = @data["ports"] if @data
    #         @pff ="hhhhhhh"
    #         # render json: @ports
    #     end
    # end

    def adminPage
        if session[:user_id]
            userRole = User.find(session[:user_id])
            if userRole.role == "admin"
                @users = User.where.not(id: session[:user_id])
                # user_to_exclude = User.find(1)  # Find the user with id 2
                # @users = User.all.excluding(user_to_exclude)
                # @users = User.all
            else
                redirect_to acceuil_path
            end
        else
            redirect_to root_path
        end
    end

    def createUser 
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "you have successfully created new user"
            redirect_to adminPage_path
            
        else
            flash[:alert] = "something went wrong"
            redirect_to signup_path
        end
    end

    def destroy
        debugger
        @userdel = User.find(params[:id])
        @userdel.destroy
        redirect_to adminPage_path, notice: 'User was successfully destroyed.'

    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)    
    end

    
end

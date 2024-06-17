module UsersHelper
    def current_user
        # save the user in the memory if the user is exist
        @current_user = USer.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # return a boolean with of || , return true if the user is exist false if it else
        !!current_user
    end
end

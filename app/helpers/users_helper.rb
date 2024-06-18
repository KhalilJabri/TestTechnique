# module UsersHelper
#     def current_user
#         # save the user in the memory if the user is exist
#         @current_user = USer.find(session[:user_id]) if session[:user_id]
#     end

#     def logged_in?
#         # return a boolean with of || , return true if the user is exist false if it else
#         !!current_user
#     end
# end

module UsersHelper
    def current_user
        # Cache the user in memory if it exists and is not already cached
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # Return a boolean indicating if the user is logged in
        !!current_user
    end
end

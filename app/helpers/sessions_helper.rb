module SessionsHelper
    def log_in(user)
        session[:username] = user.username
    end

    def current_user
        if session[:username]
            @current_user ||= User.find_by(username: session[:username])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        reset_session
        @current_user = nil
    end
end

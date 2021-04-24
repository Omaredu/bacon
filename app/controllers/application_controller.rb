class ApplicationController < ActionController::Base
    private
    
    def authenticate!
        user_id = session[:user_id]
        user = User.find_by(id: user_id)

        if user
            Current.user = user
        else
            redirect_to login_path
        end
    end

    def authenticate_admin!
        if !Current.user
            authenticate!
        end

        if !Current.user.admin
            flash[:alert] = "You don't have enought permissions to do this"
            redirect_to login_path
        end
    end
end

class ApplicationController < ActionController::API
    def check_login
        unless current_user
            render json: {"error": "Not Logged in"}, status: :unauthorized
        end
    end

    def check_login_admin
        if current_user
            unless current_user.role == "admin"
                render json: {"error": "Not admin"}, status: :unauthorized
            end
        else
            render json: {"error": "Not logged in"}, status: :unauthorized
        end
    end
end

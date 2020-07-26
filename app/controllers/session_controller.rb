class SessionController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        session[:user_id] = @user.id
        if @user.employee
            redirect_to services_path
        else
            redirect_to projects_path
        end
    end

    def destroy 
        session.delete('user_id')
        redirect_to root_path
    end
end

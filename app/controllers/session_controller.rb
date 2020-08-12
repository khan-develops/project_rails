class SessionController < ApplicationController
    skip_before_action :user_verified

    def omniauth
        user = User.from_omniauth(auth)
        if user.save(validate: false)
            session[:user_id] = user.id
            redirect_to new_project_path
        else
            redirect_to signin_path, alert: 'Could not log in with your google account'
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            if @user.employee
                redirect_to services_path
            else
                redirect_to projects_path
            end
        else
            redirect_to signin_path, alert: 'Please check your email or password'
        end
    end

    def destroy 
        session.delete('user_id')
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end



end

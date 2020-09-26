class UsersController < ApplicationController
    skip_before_action :user_verified, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            if @user.employee
                redirect_to services_path
            else
                redirect_to projects_path
            end
        else
            render :new
        end
    end

    def index
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :name, :employee)
    end

end

class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
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

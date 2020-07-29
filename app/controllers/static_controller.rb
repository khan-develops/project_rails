class StaticController < ApplicationController
    skip_before_action :user_verified

    def home
    end
    
end

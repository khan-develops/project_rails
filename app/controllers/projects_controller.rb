class ProjectsController < ApplicationController
    def new
        @project = Project.new
        @project.addresses.build
    end

    def create
        @project = Project.create(project_params)
        redirect_to project_path(@project)
    end

    def index
    end
    
    def show
    end

    private

    def project_params
        params.require(:project).permit(
            :name, :description, :start_date, 
            addresses_attributes: [:street, :line_2, :city, :state, :zipcode])
    end

end

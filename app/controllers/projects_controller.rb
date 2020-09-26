class ProjectsController < ApplicationController
    def new
        @project = Project.new
        @project.addresses.build
    end
    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end
    def index
        @projects = Project.all
    end
    def show
        @project = Project.find(params[:id])
    end
    def edit
        @project = Project.find(params[:id])
    end
    def update
        @project = Project.find(params[:id])
        @project.update_attributes(project_params)
        redirect_to project_path(@project)
    end
    def destroy
        @project = Project.find(params[:id]).destroy
        redirect_to root_path
    end
    private
    def project_params
        params.require(:project).permit(
            :name, :description, :start_date, :user_id, service_ids:[],
            addresses_attributes: [:id, :street, :line_2, :city, :state, :zipcode])
    end
end
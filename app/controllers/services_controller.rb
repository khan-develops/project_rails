class ServicesController < ApplicationController
    skip_before_action :user_verified, only: [:index, :show]

    def new
        @service = Service.new
        @service.details.build
        3.times do
            @service.products.build
        end
    end

    def create
        @service = Service.new(service_params)
        if @service.valid?
            @service.save
            redirect_to service_path(@service)
        else
            render :new
        end
    end

    def index
        if params[:project_id]
            @project = Project.find_by(id: params[:project_id])
            if @project.nil?
                redirect_to projects_path, alert: "This project is not found."
            else
                @services = @project.services 
            end
        else
            @services = Service.all
        end
    end

    def show
        if params[:project_id]
            @project = Project.find_by(id: params[:project_id])
            @service = @project.services.find_by(id: params[:id])
            if @service.nil?
                redirect_to project_services_path, alert: "Service not found"
            end
        else
            @service = Service.find(params[:id])
        end
    end

    def edit
        if params[:project_id]
            @project = Project.find_by(id: params[:project_id])
            if @project.nil?
                redirect_to project_services_path, alert: 'Project not found'
            else
                @service = @project.services.find_by(id: params[:id])
            end
        else
            @service = Service.find(params[:id])
        end
    end

    def update
        @project = Project.find_by(id: params[:project_id])
        @service = Service.find(params[:id])
        @service.update_attributes(service_params)
        if @project
            redirect_to project_service_path(@project, @service)
        else
            redirect_to service_path(@service)
        end
    end

    def destroy
        @service = Service.find(params[:id]).destroy
        redirect_to root_path
    end


    private

    def service_params
        params.require(:service).permit(
            :name, :duration,
            products_attributes: [:id, :name],
            details_attributes: [:title, :role, :completed, :user_id]
        )
    end


end

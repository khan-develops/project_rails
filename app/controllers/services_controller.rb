class ServicesController < ApplicationController
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
        @services = Service.all
    end

    def show
        @service = Service.find(params[:id])
    end

    def edit
        @service = Service.find(params[:id])
    end

    def update
        @service = Service.find(params[:id])
        @service.proudcts.destroy_all
        @service.update_attributes(service_params)
        redirect_to service_path(@service)
    end

    def destroy
        @service = Service.find(params[:id]).destroy
        redirect_to services_path
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

class Api::V1::ProvidersController < ApplicationController 
    before_action :set_provider, only [:show, :update]

    def index 
        @providers = Provider.all 
        render json: @providers 
    end 

    def create 
        @provider = Provider.create(provider_params)

        if @provider.valid?
            render json: {
                provider: ProvidersSerializer.new(@provider),
                message: "created",
                provider_info: @provider,
                error: false,
                token: encode({ 
                    provider_id: @provider.id
                })
            }, 
            status: :created 
        else 
            render json: {
                error: @provider.errors.full_messages
            }, 
            status: :not_acceptable 
        end 
    end 

    def show 
        render json: @provider 
    end 

    def update 
        @provider.update(provider_params)
        
        if @provider.save 
            render json: @provider, status: :accepted 
        else 
            render json: { 
                errors: @provider.errors.full_messages
            }
        end 
    end 

    private 

    def set_provider 
        @provider = Provider.find(params[:id])
    end 

    def provider_params 
        params.require(:provider).permit(:first_name, :last_name, :email, :password)
    end 

end 
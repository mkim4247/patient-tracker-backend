class Api::V1::UserProvidersController < ApplicationController 
    before_acrtion :set_user_provider, only [:show, :update]

    def index
        @user_providers = UserProvider.all 
        render json: @user_providers 
    end 

    def show 
        render json: @user_provider 
    end 

    def user_provider_params 
        params.require(:user_provider).permit(:user_id, :provider_id)
    end 

end 

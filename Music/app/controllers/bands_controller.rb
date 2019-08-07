class BandsController < ApplicationController

    def index
        @bands = Band.all
    end

    def new
        @band = Band.new
    end

    def show
        @band = Band.find(params[:id])
    end

    def create
        @band = Band.new(band_params)
        if @band.save!

            redirect_to bands_url
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private 
    def band_params
        params.require(:band).permit(:name)
    end
end

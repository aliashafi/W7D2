class AlbumsController < ApplicationController

    def index
        @albums = Album.all
    end

    def show 
        @album = Album.find(params[:id])
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
        band = @album.band_id
        if @album.save!
            redirect_to band_url(band)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end

    end

    def edit
        @album = Album.find(params[:id])
    end

    def update 
        @album = Album.find(params[:id])
        
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
        end
    end


    private
    def album_params
        params.require(:album).permit(:title, :year, :band_id, :record_type)
    end
end

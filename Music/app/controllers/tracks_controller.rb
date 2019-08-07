class TracksController < ApplicationController
  
  def new
    if params[:album_id]
      # debugger
      @track = Track.new(album_id: params[:album_id])
    else
      @track = Track.new
    end
  end

  def index
    @tracks = Track.where(album_id: params[:album_id])
    render album_tracks
  end

  def show
    @tracks = Track.where(album_id: params[:album_id])
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to 
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update 
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
    end
  end

  private 
  def track_params 
    params.require(:track).permit(:title, :ord, :album_id, :track_type)
  end
end

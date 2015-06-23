class ShowsController < ApplicationController
  before_action :find_show, only: [:show, :edit, :destroy, :update]

  def index
    @shows = Show.all
  end

  def create
    basic_show = Show.new(show_params)
    @date = basic_show.starts_at
    @poster = basic_show.poster
    @show = ShowCreator.new(starts_at: @date, bands: params[:bands], poster: @poster)
    if @show.create
      redirect_to shows_url
    else
      render 'new'
    end
  end

  def new
    @show = Show.new
    @band_names = Band.pluck(:name)
  end

  def show
  end

  def edit
    @band_names = Band.pluck(:name)
  end

  def update
    @update = ShowUpdater.new(show: @show.update(show_params), bands: params[:bands])
    if @update.update
      redirect_to shows_url
    end
  end

  def destroy
    if @show.destroy
      redirect_to shows_url
    end
  end

  private

  def find_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:starts_at,:poster)
  end

end

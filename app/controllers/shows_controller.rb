class ShowsController < ApplicationController
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

  private

  def show_params
    params.require(:show).permit(:starts_at,:poster)
  end

end

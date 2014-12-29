class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def create
    @date = Show.new(show_params).starts_at
    @show = ShowCreator.new(starts_at: @date, bands: params[:bands])
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
    params.require(:show).permit(:starts_at)
  end

end

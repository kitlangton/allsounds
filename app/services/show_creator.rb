class ShowCreator

  attr_reader :show

  def initialize(starts_at:,bands:,poster:nil)
    @starts_at = starts_at
    @bands = bands.uniq.select {|band| band != ""}
    @poster = poster
  end

  def create
    @show = Show.new(starts_at: @starts_at, poster: @poster)
    @bands.each do |band|
      if found_band = Band.where(name: band).first
        @show.bands << found_band
      else
        @show.bands.build(name: band)
      end
    end
    @show.save
  end
end

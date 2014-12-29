require 'spec_helper'
require_relative '../../app/services/show_creator'

describe ShowCreator do
  it "creates a show" do
    date = DateTime.now
    bands = ["Killafree", "Bunglehouse"]
    show = ShowCreator.new(starts_at: date, bands: bands)
    expect(show.create).to eq true

    returned_show = show.show
    expect(returned_show.bands.count).to eq 2
    expect(returned_show.bands.first.name).to eq "Killafree"
  end

  it "doesn't create a new band if it already exists" do
    extant_band = create(:band, name: "Bongo Boys")
    bands = ["FlumpHouse", "Bongo Boys", "Krill"]
    date = DateTime.now
    show = ShowCreator.new(starts_at: date, bands: bands).create
    expect(Band.where(name: "FlumpHouse").count).to eq 1
    expect(Band.where(name: "Bongo Boys").count).to eq 1
  end

  it "only adds a band once" do
    bands = ["FlumpHouse", "FlumpHouse", "Krill"]
    date = DateTime.now
    show = ShowCreator.new(starts_at: date, bands: bands)
    show.create
    returned_show = show.show
    expect(returned_show.bands.count).to eq 2
  end
end


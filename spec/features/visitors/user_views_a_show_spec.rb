require 'rails_helper'

feature 'Show page' do
  scenario 'visitor visits a show page' do
    show = create(:show)
    band = create(:band)
    show.bands << band

    visit show_path(show)
    expect(page).to have_content band.name
  end
end

feature 'Create shows' do
  scenario 'admin can create a show' do
    user = FactoryGirl.create(:user, :admin)
    signin(user.email, user.password)

    visit new_show_path
    date = DateTime.now + 1
    select date.year, from: 'show_starts_at_1i'
    select date.strftime("%B"), from: 'show_starts_at_2i'
    select date.day, from: 'show_starts_at_3i'
    select date.strftime("%I %p"), from: 'show_starts_at_4i'
    fill_in "bands-1", with: "Greeterz"
    fill_in "bands-2", with: "Gump"
    click_button "Create Show"
    expect(page).to have_content date.strftime("at %I:")
    expect(page).to have_content "Greeterz"
  end

  scenario "admin can create a new show"
end

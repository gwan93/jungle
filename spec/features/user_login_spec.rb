require 'rails_helper'

RSpec.feature "Users can log in successfully and are taken to the home page once they are signed in", type: :feature, js: true do
  before :each do
    @user = User.create! name: "Albert Einstein", email: "albert.einstein@gmail.com", password: "Eequalsmc2"
  end

  scenario "User will be redirect to home page after successfully logging in" do
    visit root_path

    click_link "Login"

    fill_in 'email', with: 'albert.einstein@gmail.com'
    fill_in 'password', with: 'Eequalsmc2'

    click_button "Submit"
    
    expect(page).to have_content("Products")
    expect(page).to have_content("Albert Einstein")
    expect(page).to have_content("Logout")
    
    # save_screenshot

  end

end

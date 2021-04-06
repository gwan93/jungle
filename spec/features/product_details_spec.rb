require 'rails_helper'

RSpec.feature "user can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can see a product's details" do
    visit root_path

    page.find('header a', match: :first).click
    # puts page.html
    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Price")


    save_screenshot
  end
end

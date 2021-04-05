require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "can successfully create a product given the 4 required parameters" do
      @category = Category.find_or_create_by! name: 'Gadgets'
      @product = @category.products.create!({
        name: 'Slinky',
        description: 'A fake item',
        quantity: 5,
        price: 9.99
      })
      expect(@product).to be_present
    end

    it "validates that the product has a name" do
      @category = Category.find_or_create_by! name: 'Gadgets'
      @product = @category.products.create({
        name: nil,
        description: 'A fake item',
        quantity: 5,
        price: 9.99
      })
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
      expect(@product[:name]).not_to be_present
    end

    it "validates that the product has a price" do
      @category = Category.find_or_create_by! name: 'Gadgets'
      @product = @category.products.create({
        name: 'Slinky',
        description: 'A fake item',
        quantity: 5,
        price: nil
      })
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      expect(@product.errors.full_messages[1]).to eq("Price is not a number")
      expect(@product.errors.full_messages[2]).to eq("Price can't be blank")
      expect(@product[:price]).not_to be_present
    end

    it "validates that the product has a quantity" do
      @category = Category.find_or_create_by! name: 'Gadgets'
      @product = @category.products.create({
        name: 'Slinky',
        description: 'A fake item',
        quantity: nil,
        price: 9.99
      })
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
      expect(@product[:quantity]).not_to be_present
    end

    it "validates that the product has a category" do
      @product = Product.create({
        name: 'Slinky',
        description: 'A fake item',
        quantity: 5,
        price: 9.99
      })
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
      expect(@product[:category_id]).not_to be_present
    end
  end
end

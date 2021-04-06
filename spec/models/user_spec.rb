require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it "should have the same password for both password fields" do
      @user = User.create({
        name: "Albert Einstein",
        email: "albert@einstein.com",
        password: "password1",
        password_confirmation: "password2"
      })
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it "should not create an account if another user has the same email address" do
      @albert1 = User.create({
        name: "Albert Einstein",
        email: "albert@einstein.com",
        password: "password1",
        password_confirmation: "password1"
      })

      @albert2 = User.create({
        name: "Alby Einsty",
        email: "aLbErT@EiNsTeIn.com",
        password: "password1",
        password_confirmation: "password1"
      })
      expect(@albert2.errors.full_messages[0]).to eq("Email has already been taken")
    end


    it "should require a name when signing up" do
      @user = User.create({
        name: nil,
        email: "albert@einstein.com",
        password: "password1",
        password_confirmation: "password1"
      })
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "requires an email when signing up" do
      @user = User.create({
        name: "Albert Einstein",
        email: nil,
        password: "password1",
        password_confirmation: "password1"
      })
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    

    it "require the password to have more than 8 characters" do
      @user = User.create({
        name: "Albert Einstein",
        email: "albert@einstein.com",
        password: "cats",
        password_confirmation: "cats"
      })
      expect(@user.errors.full_messages[0]).to include("Password is too short")
    end

    
  end

  describe '.authenticate_with_credentials' do
    it "should log in when provided with valid credentials" do
      User.create!({
        name: "Archie Cohen",
        email: "Archie@Cohen.com",
        password: "password1",
        password_confirmation: "password1"
      })
      @found_user = User.authenticate_with_credentials("Archie@Cohen.com", "password1")
      expect(@found_user[:name]).to eq("Archie Cohen")
      expect(@found_user[:email]).to eq("Archie@Cohen.com")
    end

    it "should not log in when provided with invalid credentials" do
      @fake_user = User.authenticate_with_credentials("Fake@User.com", "NotARealPassword")
      expect(@fake_user).to be_nil
    end

    it "should log a user in even if there are trailing or leading spaces in the email field" do
      User.create!({
        name: "Leslie Muller",
        email: "Leslie@Muller.com",
        password: "password1",
        password_confirmation: "password1"
      })
      @found_user = User.authenticate_with_credentials("       Leslie@Muller.com      ", "password1")
      expect(@found_user[:name]).to eq("Leslie Muller")
      expect(@found_user[:email]).to eq("Leslie@Muller.com")
    end

    it "should log a user in even if they use a different case for their email" do
      User.create!({
        name: "Leslie Muller",
        email: "Leslie@Muller.com",
        password: "password1",
        password_confirmation: "password1"
      })
      @found_user = User.authenticate_with_credentials("lESlIE@MullER.com", "password1")
      expect(@found_user[:name]).to eq("Leslie Muller")
      expect(@found_user[:email]).to eq("Leslie@Muller.com")
    end
    
  end
end

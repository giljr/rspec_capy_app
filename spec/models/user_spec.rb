require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it 'should be valid with email and password' do
      user = build(:user)
      # user = User.new(
      #   email: 'test@example.com',
      #   password: 'password123'
      # )
      expect(user).to be_valid
    end

    it 'should be invalid without email' do
      user = build(:user, email: nil)
      # user = User.new(
      #   email: nil,
      #   password: 'password123'
      # )
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'should be invalid without password' do
      user = build(:user, password: nil)
      # user = User.new(
      #   email: 'test@example.com',
      #   password: nil
      # )
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end

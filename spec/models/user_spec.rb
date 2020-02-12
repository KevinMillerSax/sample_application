require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'validates name presence' do
      user = User.new(name: "", email: "user@example.com").save
      expect(user).to eq(false)
    end

    it "validates email presence" do
      user = User.new(name: "Test User", email: "").save
      expect(user).to eq(false)
    end

    it "validates name length is greater than 50" do
      user = User.new(name: ("a"*51), email:"user@example.com").save
      expect(user).to eq(false)
    end

    it "validates email length is greater than 255" do
      user = User.new(name: "user", email: ("a" * 256)).save
      expect(user).to eq(false)
    end

    it "validates email has correct format" do
      user = User.new(name: "user", email: "kevinmiller.com").save
      expect(user).to eq(false)
    end

    it "should have a unique email address" do
      user = User.new(name: "user", email: "user@example.com").save
      user2 = User.new(name: "user2", email: "user@example.com").save
      expect(false).to eq(user) | (user2)
    end

    it "password should have a minimum length" do
      user = User.new(name: "user", email: "user@example.com", password: "passw").save
      expect(user).to eq(false)
    end
  end

  context 'scope tests' do
  end

end

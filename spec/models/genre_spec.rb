# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Genre, type: :model do

    it "nameが登録できる" do
      expect(FactoryBot.create(:genre)).to be_valid
    end

    it "nameがなければ登録できない" do
      expect(FactoryBot.build(:genre, name: "")).to_not be_valid
    end
end

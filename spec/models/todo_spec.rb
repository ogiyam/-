# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Todo, type: :model do

    it "taskあれば登録できる" do
      expect(FactoryBot.create(:todo)).to be_valid
    end

    it "taskがなければ登録できない" do
      expect(FactoryBot.build(:todo, task: "")).to_not be_valid
    end
end

# frozen_string_literal: true
require 'rails_helper'

RSpec.describe LargeCategory, type: :model do

  context "空白のバリデーションチェック" do
    it "カテゴリーが登録できる" do
      expect(FactoryBot.create(:large_category)).to be_valid
    end

    it "problemがなければ登録できない" do
      expect(FactoryBot.build(:large_category, problem: "")).to_not be_valid
    end

    it "solutionがなければ登録できない" do
      expect(FactoryBot.build(:large_category, solution: "")).to_not be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "problemが空白の場合にエラーメッセージが返ってきているか" do
      large_category = LargeCategory.new(problem: '', solution:'hoge')
      expect(large_category).to be_invalid
      expect(large_category.errors[:problem]).to include("を入力してください")
    end
    it "solutionが空白の場合にエラーメッセージが返ってきているか" do
      large_category = LargeCategory.new(problem: 'hoge', solution:'')
      expect(large_category).to be_invalid
      expect(large_category.errors[:solution]).to include("を入力してください")
    end
  end

end







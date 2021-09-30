# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SmallCategory, type: :model do

    it "titleとnoteが登録できる" do
      expect(FactoryBot.create(:small_category)).to be_valid
    end

    it "titleがなければ登録できない" do
      expect(FactoryBot.build(:small_category, title: "")).to_not be_valid
    end

    it "noteがなければ登録できない" do
      expect(FactoryBot.build(:small_category, note: "")).to_not be_valid
    end
    context "空白のバリデーションチェック" do
    it "titleが空白の場合にエラーメッセージが返ってきているか" do
      small_category = SmallCategory.new(title: '', note:'hoge')
      expect(small_category).to be_invalid
      expect(small_category.errors[:title]).to include("を入力してください")
    end
    it "noteが空白の場合にエラーメッセージが返ってきているか" do
      small_category = SmallCategory.new(title: 'hoge', note:'')
      expect(small_category).to be_invalid
      expect(small_category.errors[:note]).to include("を入力してください")
    end
  end


end


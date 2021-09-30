require 'rails_helper'


describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:large_category) { create(:large_category, user: user) }
  let!(:other_large_category) { create(:large_category, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe 'ユーザー編集画面のテスト' do
    before do
     visit edit_user_path(user)
    end
    context '表示の確認' do
     it '編集前の名前がフォームに表示(セット)されている' do
      expect(page).to have_field 'user[name]', with: user.name
     end
     it '保存ボタンが表示される' do
      expect(page).to have_button '保存する'
     end
    end
    context '更新処理に関するテスト' do
     it '更新後のリダイレクト先は正しいか' do
      fill_in 'user[name]', with: Faker::Lorem.characters(number:5)
      click_button '保存する'
      expect(page).to have_current_path user_path(user)
     end
    end
  end
end


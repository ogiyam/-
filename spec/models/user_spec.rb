require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前を表示できること" do
  user = User.new(
        name:  "あおい"
  )
  expect(user.name).to eq "あおい"
end

  context "名前が入力されている場合" do
    let!(:user) do
      User.new(name:'あおい', email:'test@test', password:'aoiaoi')
    end
    it '登録できる' do
      expect(user).to be_valid
    end
  end

# context 'フォームの入力値が正常' do
#   it 'ユーザーの新規作成が成功' do
#     # ユーザー新規登録画面へ遷移

#     fill_in 'name', with: 'test@example.com'
#     # Emailテキストフィールドにtest@example.comと入力
#     fill_in 'email', with: 'test@example.com'
#     # Passwordテキストフィールドにpasswordと入力
#     fill_in 'password', with: 'password'
#     # Password confirmationテキストフィールドにpasswordと入力
#     click_button '新規登録'




end

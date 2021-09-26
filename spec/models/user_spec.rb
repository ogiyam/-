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
       binding.pry
    end
  end
 





end

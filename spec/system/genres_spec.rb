require 'rails_helper'

# context '新規作成のテスト' do
#   before do
#       visit admin_genres_path
#     end
#     before do
#       fill_in 'genre[name]', with: Faker::Lorem.characters(number: 5)
#     end

#     it '自分の新しいジャンルが正しく保存される' do
#       expect { click_button '新規作成' }.to change(genre, :count).by(1)
#     end
#     it 'リダイレクト先が、一覧画面になっている' do
#       click_button '新規作成'
#       expect(page).to have_current_path admin_genres_path
#     end
# end


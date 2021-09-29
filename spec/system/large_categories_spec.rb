require 'rails_helper'

# describe '投稿のテスト' do
#   let!(:large_category) { create(:large_category, problem:'problem',solution:'solution') }
#   describe '一覧画面のテスト' do
#     before do
#       visit user_large_categories_path(large_category.user)
#     end
#     context '投稿処理のテスト' do
#       it '投稿後のリダイレクト先は正しいか' do
#         fill_in 'large_category[problem]', with: Faker::Lorem.characters(number:5)
#         fill_in 'large_category[solution]', with: Faker::Lorem.characters(number:20)
#         click_button '新規作成'
#         expect(page).to have_current_path user_large_categories_path(large_category.user)
#       end
#     end
#   end
#   describe '編集画面のテスト' do
#     before do
#       visit edit_large_category_path(large_category)
#     end
#     context '表示の確認' do
#       it '編集前のフォームに表示されている' do
#         expect(page).to have_field 'large_category[problem]', with: large_category.problem
#         expect(page).to have_field 'large_category[solution]', with: large_category.solution
#       end
#       it '保存ボタンが表示される' do
#         expect(page).to have_button '保存する'
#       end
#     end
#     context '更新処理に関するテスト' do
#       it '更新後のリダイレクト先は正しいか' do
#         fill_in 'large_category[problem]', with: Faker::Lorem.characters(number:5)
#         fill_in 'large_category[solution]', with: Faker::Lorem.characters(number:20)
#         click_button '保存する'
#         expect(page).to have_current_path user_large_categories_path(large_category)
#       end
#     end
#   end
#   context '削除のテスト' do
#       it 'カテゴリーの削除' do
#         expect{ large_category.destroy }.to change{ LargeCategory.count }.by(-1)
#       end
#     end
# end


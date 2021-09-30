require 'rails_helper'

# describe '投稿のテスト' do
#   let!(:small_category) { create(:small_category, title:'title',note:'note') }
#   describe '一覧画面のテスト' do
#     before do
#       visit large_category_small_categories_path(small_category.large_category)
#     end
#     context '表示の確認' do
#       it ' カテゴリーが表示されているか' do
#         expect(page).to have_content large_category.problem
#         expect(page).to have_content large_category.solution
#       end
#     end
#   end
# end
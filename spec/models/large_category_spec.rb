require 'rails_helper'

RSpec.describe LargeCategory, type: :model do
  context "problemとsolutionが入力されている場合" do
    let!(:large_category) do
      LargeCategory.new(problem:'problem',solution:'solution')
    end
    before do
      binding.pry
      visit user_large_categories_path(current_user.id)
    end
    it 'カテゴリーを保存できる' do
      fill_in 'large_category[problem]', with: Faker::Lorem.characters(number:5)
      fill_in 'large_category[solution]', with: Faker::Lorem.characters(number:20)
      click_button '新規作成'
      expect(page).to have_current_path user_large_categories_path(LargeCategory.last)
      # large_category.valid?
      # expect(large_category.errors.messages[:problem, :solution]).to include('Can not be blank')
    end
  end
  
     






    it "large_categoryのproblemとsolutionを表示し、編集・削除のリンクが表示されているか" do
     LargeCategory.create(problem:'problem',solution:'solution')
      LargeCategory.all.each_with_index do |large_category,i|
        # Editリンク
        show_link = find_all('a')
        expect(show_link.native.inner_text).to match(/edit/i)
        expect(show_link[:href]).to eq edit_large_category(large_category)
        # Destroyリンク
        show_link = find_all('a')
        expect(show_link.native.inner_text).to match(/destroy/i)
        expect(show_link[:href]).to eq large_category(large_category)
        # small_categoryリンク
        show_link = find_all('a')
        expect(show_link.native.inner_text).to match(//i)
        expect(show_link[:href]).to eq large_category(large_category)

      end
	   end

end






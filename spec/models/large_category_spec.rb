require 'rails_helper'

RSpec.describe LargeCategory, type: :model do
  context "problemとsolutionが入力されている場合" do
    let!(:large_category) do
      LargeCategory.new(problem:'problem',solution:'solution')
    end
    it 'カテゴリーを保存できる' do
      expect(large_category).to be_valid
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

      end
	   end

end






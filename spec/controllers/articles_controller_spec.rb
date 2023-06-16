require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    before do
        @controller = ArticlesController.new
        @article = FactoryBot.create(:article)
    end

    it 'slugはtitleを小文字にしてスペースをハイフンに変える' do
        slug = controller.send(:create_slug, @article.title)
        expected_slug = "how-to-train-your-dragon"
        
        expect(slug).to eq(expected_slug)
    end
end

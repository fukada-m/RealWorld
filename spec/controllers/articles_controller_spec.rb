require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    before do
        @controller = ArticlesController.new
        @article = FactoryBot.create(:article)
    end
    
    describe "create_slug" do

        it 'slugはtitleを小文字にしてスペースをハイフンに変える' do
            slug = controller.send(:create_slug, @article.title)
            expected_slug = "how-to-train-your-dragon"
            
            expect(slug).to eq(expected_slug)
        end
    end

    describe "GET #show" do
        before do
            @article.slug = controller.send(:create_slug, @article.title)
            @article.save
        end

        it "当てはまる記事があった場合は正常にレスポンスを返す" do
            get :show, params: { slug: "how-to-train-your-dragon" }
            expect(response).to have_http_status(:success)
        end
        
        it "当てはまる記事がなかった場合はエラーレスポンスを返す" do
            get :show, params: { slug: "test-message" }
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end
end

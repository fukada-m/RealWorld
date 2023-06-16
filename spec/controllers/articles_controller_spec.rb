require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe "POST #create" do
        it "記事が作成できた場合はsuccessを返す" do
            post :create, params: { article: FactoryBot.attributes_for(:article) }
            expect(response).to have_http_status(:success)
        end

        it "記事が作成できなかった場合はエラーレスポンスを返す" do
            post :create, params: { article: {title: nil} }
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end
    
    describe "最初に記事を一つ登録しておく" do
        before do
            @article = FactoryBot.create(:article)
        end
        
        describe "create_slug" do
            @controller = ArticlesController.new
            it '小文字にしてスペースをハイフンに変えて返す' do
                slug = controller.send(:create_slug, @article.title)
                expect(slug).to eq(@article.slug)
            end
        end
        

        describe "GET #show" do
            it "当てはまる記事があった場合はsuccessレスポンスを返す" do
                get :show, params: { slug: @article.slug }
                expect(response).to have_http_status(:success)
            end

            it "当てはまる記事がなかった場合はエラーレスポンスを返す" do
                get :show, params: { slug: "test-message" }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end

        describe "PUT #update" do
            it "記事が更新できた場合はsuccessレスポンスを返す" do
                put :update, params: { slug: @article.slug, article: { title: "Did you train your dragon?" } }
                expect(response).to have_http_status(:success)
            end

            it "記事が更新できなかった場合はエラーレスポンスを返す" do
                get :show, params: { slug: "test-message", article: { title: "Did you train your dragon" } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end

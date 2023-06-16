require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe "create_slug" do
        it '小文字にしてスペースをハイフンに変えて返すメソッド' do
            @controller = ArticlesController.new
            slug = controller.send(:create_slug, "How to train your dragon")
            expect(slug).to eq("how-to-train-your-dragon")
        end
    end

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

        describe "GET #show" do
            it "当てはまる記事があった場合はsuccessレスポンスを返す" do
                get :show, params: { slug: @article.slug }
                expect(response).to have_http_status(:success)
            end

            it "記事が見つからなかった場合はエラーレスポンスを返す" do
                get :show, params: { slug: "miss" }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end

        describe "PUT #update" do
            it "記事が更新できた場合はsuccessレスポンスを返す" do
                put :update, params: { slug: @article.slug, article: { title: "Did you train your dragon?" } }
                expect(response).to have_http_status(:success)
            end

            it "記事が見つからなかった場合はエラーレスポンスを返す" do
                get :show, params: { slug: "miss", article: { title: "Did you train your dragon" } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end

        describe "DELETE #destroy" do
            it "記事が削除できた場合はsuccessレスポンスを返す" do
                delete :destroy, params: {slug: @article.slug}
                expect(response).to have_http_status(:success)
            end

            it "記事が見つからなかった場合はエラーレスポンスを返す" do
                delete :destroy, params: {slug: "miss"}
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end

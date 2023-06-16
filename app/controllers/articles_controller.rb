class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @body = params.require(:article).permit(:title, :description, :body)
        @article = Article.new(@body)
        @article.slug = create_slug(@article.title)
        if @article.save 
            respose_article(@article)
        else
            render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        @article = Article.find_by(slug: params[:slug])
        if @article
            respose_article(@article)
        else
            render json: { errors: "該当する記事はありませんでした" }, status: :unprocessable_entity
        end
    end

    private

    def respose_article(article)
        render json: {article: {
            slug: article.slug,
            title:  article.title,
            description: article.description,
            body: article.body,
            createdAt: article.created_at,
            updatedAt: article.updated_at
            }
        }, status: :ok
    end

    def create_slug(title)
        title.downcase.gsub(" ", "-")

    end
end

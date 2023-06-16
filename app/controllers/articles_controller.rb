class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @body = params.require(:article).permit(:title, :description, :body)
        @article = Article.new(@body)
        if @article.save 
            render json: {article: {
                slug: create_slug,
                title:  @article.title,
                description: @article.description,
                body: @article.body,
                createdAt: @article.created_at,
                updatedAt: @article.updated_at
                }
            }
        else
            render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def create_slug
        @article.title.downcase.gsub(" ", "-")

    end
end

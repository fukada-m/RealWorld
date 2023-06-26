# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @body = params.require(:article).permit(:title, :description, :body)
    @article = Article.new(@body)
    @article.slug = create_slug(@article.title)
    if @article.save
      response_article
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    if @article
      response_article
    else
      not_found_article
    end
  end

  def update
    @article = Article.find_by(slug: params[:slug])
    @body = params.require(:article).permit(:title)
    if @article
      update_article
      response_article
    else
      not_found_article
    end
  end

  def destroy
    @article = Article.find_by(slug: params[:slug])
    if @article
      @article.destroy
      render json: { status: :ok }
    else
      not_found_article
    end
  end

  private

  def update_article
    @article.title = @body['title']
    @article.slug = create_slug(@body['title'])
    @article.save
  end

  def response_article
    render json: { article: @article }, status: :ok
  end

  def not_found_article
    render json: { errors: '該当する記事はありませんでした。' }, status: :unprocessable_entity
  end

  def create_slug(title)
    title.downcase.gsub(' ', '-')
  end
end

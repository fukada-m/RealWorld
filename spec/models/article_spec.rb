require 'rails_helper'

RSpec.describe Article, type: :model do

  before do
    @article = FactoryBot.create(:article)
  end

  it "記事が作成できる" do
    expect(@article).to be_valid
  end

  describe 'バリデーションチェック' do
    it "titleが空だった場合バリデーションエラー" do
      article = FactoryBot.build(:article, title: nil)
      article.valid?
      expect(article.errors[:title]).to include("can't be blank")
    end
    it "descriptionが空だった場合バリデーションエラー" do
      article = FactoryBot.build(:article, description: nil)
      article.valid?
      expect(article.errors[:description]).to include("can't be blank")
    end

    it "bodyが空だった場合バリデーションエラー" do
      article = FactoryBot.build(:article, body: nil)
      article.valid?
      expect(article.errors[:body]).to include("can't be blank")
    end
  end

end

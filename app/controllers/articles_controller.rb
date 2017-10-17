class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('published_at DESC')
    @daily_articles = @articles.group_by(&:day)
    @barrooms = Barroom.all
  end
end

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('created_at ASC')
    @daily_articles = @articles.group_by(&:day)
    @barrooms = Barroom.all
  end
end

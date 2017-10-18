class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('published_at DESC').paginate(:page => params[:page], :per_page => 20)
    @daily_articles = @articles.group_by(&:day)
    @barrooms = Barroom.all
  end
end

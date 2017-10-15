class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @barrooms = Barroom.all
  end
end

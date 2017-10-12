class ArticlesController < ApplicationController
  def news
    feed = Feedjira::Feed.fetch_and_parse 'https://www.google.com/alerts/feeds/00315441985827146858/9510803395009003313'
    @entries = feed.entries
    @barrooms = Barroom.all
  end
end

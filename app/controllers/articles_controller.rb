class ArticlesController < ApplicationController
  def news
    feed = Feedjira::Feed.fetch_and_parse 'https://www.google.com/alerts/feeds/00315441985827146858/14937607138872366122'
    @entries = feed.entries
    @barrooms = Barroom.all
  end
end

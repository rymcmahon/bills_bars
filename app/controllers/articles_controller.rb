class ArticlesController < ApplicationController
  def news
    require 'rss'
    require 'open-uri'

    rss_array = []
    url = 'https://www.google.com/alerts/feeds/00315441985827146858/9510803395009003313'

    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
         rss_array << item
        end
        @news = rss_array
    end
    @barrooms = Barroom.all
  end
end

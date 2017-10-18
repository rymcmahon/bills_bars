desc "A task to call Google Alerts"
task :call_google_alerts => :environment do
  feed = Feedjira::Feed.fetch_and_parse 'https://www.google.com/alerts/feeds/00315441985827146858/14937607138872366122'
  feed.entries.each do |entry|
   @article = Article.where(entry_id: entry.id).first_or_create(
     title: entry.title,
     url: entry.url,
     published_at: entry.published,
     content: entry.content
   )
  end
end
namespace :sync do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(summary: entry.summary, url: entry.url, image: entry.image, published: entry.published)
        puts "Synced Entry - #{entry.title}"
      end
      puts "Synced Feed - #{feed.title}"
    end
  end
end

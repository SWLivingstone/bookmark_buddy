10.times do
  Topic.create!(
    title: RandomData.random_word
  )
end

50.times do
  Bookmark.create!(
    title: RandomData.random_word,
    url: RandomData.random_url,
    topic: Topic.all.sample
  )
end

puts "Seed complete"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"

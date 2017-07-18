5.times do
  User.create!(
    email: RandomData.random_email,
    password: "password"
  )
end


10.times do
  Topic.create!(
    title: RandomData.random_word,
    user: User.all.sample
  )
end

50.times do
  Bookmark.create!(
    title: RandomData.random_word,
    url: RandomData.random_url,
    topic: Topic.all.sample,
    user: User.all.sample
  )
end

puts "Seed complete"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"

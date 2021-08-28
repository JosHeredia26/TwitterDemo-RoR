require "faker"

puts "Start seeding"
Comment.destroy_all
Tweet.destroy_all
User.destroy_all

puts "Seeding users..."

# Create own user
jos = User.new(
  email: "jose.heredia.pachas@gmail.com",
  password: "123456",
  username: "JosHeredia26",
  name: "José Heredia"
)
puts "User not created.\nErrors: #{jos.errors.full_messages}" unless jos.save

rand(3..5).times do
  user_data = {
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    username: Faker::Internet.username,
    name: Faker::Name.name
  }
  new_user = User.new(user_data)
  puts "User not created.\nErrors: #{new_user.errors.full_messages}" unless new_user.save
end

puts "Seeding tweets..."
users = User.all
users.each do |user|
  rand(1..3).times do
    tweet_data = {
      body: Faker::Lorem.paragraph,
      user: user
    }
    new_tweet = user.tweets.new(tweet_data)
    puts "Tweet not created.\nErrors: #{new_tweet.errors.full_messages}" unless new_tweet.save
  end
end

puts "Seeding comments..."
tweets = Tweet.all
tweets.each do |tweet|
  rand(2..4).times do
    comment_data = {
      body: Faker::Lorem.paragraph,
      tweet: tweet,
      user: users.sample
    }
    new_comment = tweet.comments.new(comment_data)
    puts "Tweet not created.\nErrors: #{new_comment.errors.full_messages}" unless new_comment.save
  end
end

puts "Seeding avatars..."
users = User.all
users.each_with_index { |user, index| user.avatar.attach(io: File.open("public/Avatar/#{index}.png"),filename:"#{index}.png") }

puts "Finish seeding"

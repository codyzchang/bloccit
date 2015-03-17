require 'faker'

50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end

do
Post.create!(
  title: "The Police Meeting",
  body: "Chief Wiggim meets Mike Ehrmantraut"
)
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

do
Comment.create!(
  post: posts,
  body: “Tomo-arigato.Mr.Robato”
)
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
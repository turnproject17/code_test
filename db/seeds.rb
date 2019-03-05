# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create name: "Clara Oswald", email: "clara@alkhemy.co"
user_2 = User.create name: "Jenny Smith", email: "jenny@alkhemy.co"

(3..100).to_a.each do |index|
  Article.create title: "Article #{index}",
                 content: "Content",
                 published_at: (Time.now - 3.days) + index.hours,
                 author_id: [user.id, user_2.id][index % 2]
end

Article.create title: "Article One", content: "Content", published_at: Time.now + 1.weeks, author_id: user.id
Article.create title: "Article Two", content: "Content", published_at: Time.now - 1.weeks, author_id: user.id
Article.create title: "Article Three", content: "Content", author_id: user.id

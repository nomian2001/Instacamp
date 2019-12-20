require 'faker'

puts "Seeding data"

# if Photo.count > 0
#     puts "WARNING: there is existing data."
#     puts "To re-seed, first go to rails console and type 'Photo.delete_all'"
#     puts "For heroku, type 'heroku run rails console'"
#     exit
# end

# Photo.create!(url: "https://i.ytimg.com/vi/mh7VYZ2zeRI/maxresdefault.jpg", username: "Supersaiyan", caption: "The first time") 
# Photo.create!(url: "http://i.imgur.com/vrU6Kmu.jpg", username: "gamer", likes_count: 100, caption: "Hello")

# puts "Seeded #{Photo.count} photos."

10.times do
    username = Faker::Name.name 
    caption = Faker::Quote.singular_siegler
    url  = Faker::LoremPixel.image(size: "500x600", is_gray: false, category: 'sports', number: nil, text: 'username')
    # avatar = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
    like = Faker::Number.number(digits: 4)
    Photo.create!(url: url, username: username, caption: caption, likes_count: like)
end
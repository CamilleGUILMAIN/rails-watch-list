# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database"
Bookmark.destroy_all
Movie.destroy_all


puts "Creating data"
10.times do
  Movie.create(title: Faker::Movie.title,
                overview: Faker::Lorem.paragraph,
                poster_url: "https://media.istockphoto.com/id/1494642262/fr/photo/les-gens-dans-lauditorium-de-cin%C3%A9ma-avec-%C3%A9cran-blanc-vide.jpg?s=612x612&w=0&k=20&c=Z_NZBlVFSMncfFhN2w7BkwaDuAfiQUUdecZ__M7hlbM=",
                rating: rand(0.0..10.0).round(1))
end

puts "Movies created!"

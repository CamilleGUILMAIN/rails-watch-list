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
require 'uri'
require "json"

require 'net/http'

url = URI("https://tmdb.lewagon.com/movie/top_rated")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'

response = http.request(request)
test = response.read_body
file = JSON.parse(test)
movies = file["results"].first(50)

poster_url = "https://image.tmdb.org/t/p/w500"

movies.each do |movie|
  Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "#{poster_url}#{movie["poster_path"]}", rating: movie["vote_average"])
end

puts "Movies created!"
puts Movie.all

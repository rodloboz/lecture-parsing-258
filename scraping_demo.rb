require 'open-uri'
require 'nokogiri'
require 'byebug'

# Let's scrape recipes from http://www.epicurious.com


BASE_URL = 'https://www.last.fm/music/'

puts "What's the name of the artist?"
print "> "
artist = gets.chomp

url = BASE_URL + artist

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

top_tracks = []
html_doc.search('.chartlist-name').each do |element|
  top_tracks << element.text.strip
end

puts "The top track by #{artist} are:"
top_tracks.each_with_index do |track, index|
  puts "#{index + 1} - #{track}"
end









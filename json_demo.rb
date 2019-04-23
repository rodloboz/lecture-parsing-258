require 'json'
require 'byebug'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

serialized_beers = File.read(filepath)
beers = JSON.parse(serialized_beers)


puts "What's the name of the beer?"
print "> "
name = gets.chomp

puts "What's the appearance of the beer?"
print "> "
appearance = gets.chomp

puts "What's the origin of the beer?"
print "> "
origin = gets.chomp

beers["beers"] << {
  name: name,
  appearance: appearance,
  origin: origin
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end

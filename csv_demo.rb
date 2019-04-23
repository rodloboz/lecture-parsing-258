require 'csv'
require 'byebug'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'
csv_options = {
  col_sep: ',',
  quote_char: '"',
  headers: :first_row,
  header_converters: :symbol
}

beers = []
CSV.foreach(filepath, csv_options) do |row|
  beer = {
    name: row[:name],
    appearance: row[:appearance],
    origin: row[:origin]
  }
  beers << beer
end

puts "What's the name of the beer?"
print "> "
name = gets.chomp

puts "What's the appearance of the beer?"
print "> "
appearance = gets.chomp

puts "What's the origin of the beer?"
print "> "
origin = gets.chomp

beers << {
  name: name,
  appearance: appearance,
  origin: origin
}

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["Name", "Appearance", "Origin"]

  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end























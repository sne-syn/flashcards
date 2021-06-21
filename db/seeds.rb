require 'csv'

csv_text = File.read('lib/seeds/scraped_cards_data.csv')
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
cards = []

csv.each do |row|
  cards << row.to_hash
end

Card.destroy_all

cards.each do |card|
  CreateCardService.call(card)
end

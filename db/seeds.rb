require 'csv'
require_relative '../lib/scraper'

Card.destroy_all

scrape = Scraper.new
cards = scrape.get_data(100)

cards.each do |card|
  CreateCardService.call(card)
end

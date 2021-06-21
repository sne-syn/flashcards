require 'nokogiri'
require 'open-uri'
require 'csv'

def slice_one_fifth(array)
  array.slice(0, array.length / 5)
end

def scrape_wordlist
  studynow_url = 'https://studynow.ru/dicta/allwords'
  html = open(studynow_url)
  doc = Nokogiri::HTML(html)
  data_node_set = doc.css('#wordlist').css('tr')
  cards = []

  data_node_set.each do |node|
    original_text = node.css('td[2]').text
    translated_text = node.css('td[3]').text

    card = [original_text, translated_text]

    cards << card
  end

  slice_one_fifth(cards)
end

filepath = 'lib/seeds/scraped_cards_data.csv'
csv_options = {headers: :first_row, col_sep: ','}

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['original_text', 'translated_text']

  scrape_wordlist.each do |card|
    csv << [card[0], card[1]]
  end
end

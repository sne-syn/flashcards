require 'nokogiri'
require 'open-uri'

class Scraper
  def scrape_wordlist
    studynow_url = 'https://studynow.ru/dicta/allwords'
    html = open(studynow_url)
    doc = Nokogiri::HTML(html)
    data_node_set = doc.css('#wordlist').css('tr')
    cards = []

    data_node_set.each do |node|
      original_text = node.css('td[2]').text
      translated_text = node.css('td[3]').text
      card = {
        original_text: original_text,
        translated_text: translated_text
      }

      cards << card
    end

    cards
    puts (cards)
  end
end

scrape = Scraper.new
scrape.scrape_wordlist

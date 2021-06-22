require 'nokogiri'
require 'open-uri'
require 'csv'

class Scraper
  def parse_url(url)
    html = open(url)
    Nokogiri::HTML(html)
  end

  def scrape_wordlist
    studynow_url = 'https://studynow.ru/dicta/allwords'
    doc = parse_url(studynow_url)
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

  def generate_csv_file_with_data
    filepath = 'lib/seeds/scraped_cards_data.csv'
    csv_options = {headers: :first_row, col_sep: ','}

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['original_text', 'translated_text']

      scrape_wordlist.each do |card|
        csv << [card[0], card[1]]
      end
    end
  end

  private
  def slice_one_fifth(array)
    array.slice(0, array.length / 5)
  end
end

scrape = Scraper.new
scrape.generate_csv_file_with_data

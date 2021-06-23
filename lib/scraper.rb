require 'nokogiri'
require 'open-uri'
require 'csv'

class Scraper
  DATA_INPUT_URL = 'https://studynow.ru/dicta/allwords'
  DATA_OUTPUT_FILE = 'lib/seeds/scraped_cards_data.csv'

  def parse_url(url)
    html = open(url)
    Nokogiri::HTML(html)
  end

  def scrape_data
    doc = parse_url(DATA_INPUT_URL)
    data_node_set = doc.css('#wordlist').css('tr')
    scraped_elements = []
  
    data_node_set.each do |node|
      original_text = node.css('td[2]').text
      translated_text = node.css('td[3]').text
  
      element_data = [original_text, translated_text]
  
      scraped_elements << element_data
    end

    scraped_elements
  end

  def generate_csv_file_with_data(amount)
    data = slice_data(scrape_data, amount)
    csv_options = {headers: :first_row, col_sep: ','}

    CSV.open(DATA_OUTPUT_FILE, 'wb', csv_options) do |csv|
      csv << ['original_text', 'translated_text']

      data.each do |element_data|
        csv << [element_data[0], element_data[1]]
      end
    end
  end

  def get_data(amount)
    generate_csv_file_with_data(amount)

    csv_text = File.read(DATA_OUTPUT_FILE)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    data = []

    csv.each do |row|
      data << row.to_hash
    end

    data
  end

  private
  def slice_data(array, amount)
    array.slice(0, amount)
  end
end

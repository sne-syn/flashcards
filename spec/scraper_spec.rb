require_relative '../lib/scraper'

RSpec.describe Scraper do
  let(:scrape) { Scraper.new }

  describe 'Scraper#get_data' do
    it 'gets correct data', :vcr, js: false do
      expect(scrape.get_data(1)).to eq([{"original_text"=>"abandon", "translated_text"=>"оставить, забросить"}])
    end

    it 'gets right amount of data', :vcr, js: false do
      expect(scrape.get_data(5).length).to eq(5)
    end
  end
end

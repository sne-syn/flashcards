require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to respond_to(:original_text) }
  it { is_expected.to respond_to(:translated_text) }
  it { is_expected.to respond_to(:review_date) }

  context 'validation tests' do
    let (:card) { build(:card) }

    it 'ensures original text is present' do
      card.original_text = nil
      expect(card.save).to eq(false)
    end

    it 'ensures translated text is present' do
      card.translated_text = nil
      expect(card.save).to eq(false)
    end

    it 'review_date can be nil' do
      card.review_date = nil
      expect(card.save).to eq(true)
    end

    it 'review_date can be blank' do
      card.review_date = ''
      expect(card.save).to eq(true)
    end
  end
end

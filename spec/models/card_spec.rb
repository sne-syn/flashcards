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

    it 'ensures translated text isn\'t equal original text' do
      card.translated_text = 'hello'
      card.original_text = 'hello'
      expect(card.save).to eq(false)
    end

  end
end

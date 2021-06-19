require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to respond_to(:original_text) }
  it { is_expected.to respond_to(:translated_text) }
  it { is_expected.to respond_to(:review_date) }

  context 'CRUD tests' do
    let (:card) { build(:card) }

    it 'checks that a card can be created' do
      expect(card).to be_valid
    end

    it 'checks that a card can be updated' do
      card.update(:translated_text => 'превзойти')
      expect(Card.find_by_translated_text('превзойти')).to eq(card)
    end

    it 'checks that a card can be destroyed' do
      card.destroy
      expect(Card.find_by_translated_text('превзойти')).to be_nil
    end
  end

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

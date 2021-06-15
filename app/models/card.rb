class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true, exclusion: { in: lambda{ |card| [card.original_text] }, 'The value must be different from the one used in the original text' }
  validates :review_date, presence: true

end

class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true, exclusion: { in: lambda{ |card| [card.original_text] }}
  validates :review_date, presence: true
end

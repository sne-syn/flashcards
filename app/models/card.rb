class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true, allow_blank: true
end

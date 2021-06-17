class Card < ApplicationRecord
  before_save :set_review_date 

  validates :original_text, presence: true
  validates :translated_text, presence: true, exclusion: { in: lambda{ |card| [card.original_text] }, message: 'Перевод не должен повторять слово для изучения'}

  protected
  def set_review_date 
    self.review_date = Time.now + 3.days
  end
end

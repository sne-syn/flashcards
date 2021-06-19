class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate  :check_values_not_equal

  protected
  def check_values_not_equal
    errors.add(:translated_text, I18n.t('form.equal_values_error_message')) if original_text.try(:downcase) == translated_text.try(:downcase)
  end
end

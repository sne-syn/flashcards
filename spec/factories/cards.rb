FactoryBot.define do
  factory :card do
    original_text { 'upstage' }
    translated_text { 'затмевать' }
    review_date { ReviewDateService.call(Time.now) }
  end
end

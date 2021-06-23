FactoryBot.define do
  factory :card do
    original_text { 'upstage' }
    translated_text { 'затмевать' }
    review_date { Time.now + 3.days }
  end
end

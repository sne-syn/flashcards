class CreateCardService < ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    calculated_review_date = Time.now + 3.days
    Card.create(params.merge(review_date: calculated_review_date))
  end
end

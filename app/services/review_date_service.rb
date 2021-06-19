class ReviewDateService < ApplicationService
  attr_reader :current_datetime

  def initialize(current_datetime)
    @current_datetime = current_datetime
  end

  def call
    current_datetime + 3.days
  end
end

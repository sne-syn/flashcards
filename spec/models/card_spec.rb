require 'spec_helper'

describe Card do
  it { is_expected.to respond_to(:original_text) }
  it { is_expected.to respond_to(:translated_text) }
  it { is_expected.to respond_to(:review_date) }
end

require 'rails_helper'

describe 'Cards page' do
  before do
    visit '/'
  end

  it 'should have the correct heading' do
    expect(page).to have_content(I18n.t('cards.heading'))
  end
end

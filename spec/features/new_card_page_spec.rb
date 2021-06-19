require 'rails_helper'

describe 'New Card Page' do
  before do
    visit '/cards/new'
  end

  it 'should have the correct heading' do
    expect(page).to have_content(I18n.t('new_card.heading'))
  end
end

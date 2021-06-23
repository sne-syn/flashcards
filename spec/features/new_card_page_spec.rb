require 'rails_helper'

describe 'New Card Page' do
  before do
    visit '/cards/new'
  end

  let (:card) { build(:card) }

  it 'should have the correct heading' do
    expect(page).to have_content(I18n.t('new_card.heading'))
  end
  
  it 'adds a new card to the cards list' do
    fill_in 'card[original_text]', with: card.original_text
    fill_in 'card[translated_text]', with: card.translated_text
    click_button I18n.t('form.create_card_btn')
    expect(page).to have_content(card.original_text)
  end

  it 'clears inputs on cancel btn click and rerender form' do
    fill_in 'card[original_text]', with: card.original_text
    fill_in 'card[translated_text]', with: card.translated_text
    click_link I18n.t('form.cancel_btn')
    
    expect(page).to have_content(I18n.t('new_card.heading'))
    expect(page).not_to have_content(card.original_text)    
  end
    
end

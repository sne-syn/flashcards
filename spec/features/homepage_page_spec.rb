require 'rails_helper'

describe 'Home page' do
  before do
    visit '/'
  end

  it 'should have the correct heading' do
    expect(page).to have_content(I18n.t('index.heading.main'))
  end
end

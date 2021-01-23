require 'spec_helper'

describe 'Product Stores', type: :feature, js: true do
  stub_authorization!

  before do
    create(:product)
    create(:store, default_currency: 'USD', name: 'First store', code: 'Spree1')
    create(:store, default_currency: 'USD', name: 'Second store', code: 'Default1')
    create(:store, default_currency: 'USD', name: 'Marketplace', code: 'Marketplace1')
    visit spree.admin_products_path

    within_row(1) { click_icon :edit }
  end

  context 'editing product stores' do
    it 'updates list of stores that product is assigned to' do
      select2 'Marketplace', from: 'Stores'
      select2 'Second store', from: 'Stores'

      click_button 'Update'

      expect(page).to have_content 'successfully updated'
      expect(page).to have_content 'Marketplace'
      expect(page).to have_content 'Second store'
    end
  end
end

require 'spec_helper'

describe 'Product Stores', type: :feature, js: true do
  stub_authorization!

  let!(:store)   { create(:store, default_currency: 'USD', name: 'First store', code: 'first_store', default: true) }
  let!(:store_0) { create(:store, default_currency: 'USD', name: 'Second store', code: 'second_store') }
  let!(:store_1) { create(:store, default_currency: 'USD', name: 'Marketplace', code: 'marketplace') }
  let!(:product) { create(:product) }

  before do
    ApplicationController.view_paths = [
        ActionView::FixtureResolver.new(
            'spree/layouts/spree_application.html.erb' => 'Default layout <%= yield %>',
            "spree/layouts/first_store/spree_application.html.erb" => 'Store layout <%= yield %>',
            'application/index.html.erb' => 'hello'
        )
    ]

    visit spree.admin_products_path

    within_row(1) { click_icon :edit }
  end

  context 'editing product stores' do
    it 'shows stores that match query' do
      fill_in 'Stores', with: 'sto'

      expect(page).to have_content 'First store'
      expect(page).to have_content 'Second store'
      expect(page).not_to have_content 'Marketplace'
    end

    it 'still shows stores that match query' do
      fill_in 'Stores', with: 'place'

      expect(page).not_to have_content 'First store'
      expect(page).not_to have_content 'Second store'
      expect(page).to have_content 'Marketplace'
    end

    it 'updates list of stores that product is assigned to' do
      fill_in 'Stores', with: 'place'

      within('#select2-drop') do
        first('.select2-result').click
      end

      click_button 'Update'

      expect(page).to have_content 'successfully updated'
      expect(page).to have_content 'Marketplace'
    end
  end
end

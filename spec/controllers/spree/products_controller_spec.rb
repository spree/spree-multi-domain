require 'spec_helper'

describe Spree::ProductsController do

  let!(:product) { FactoryBot.create(:product) }

  describe 'on :show to a product without any stores' do
    let!(:store) { FactoryBot.create(:store) }

    it 'should raise ActiveRecord::RecordNotFound' do
      expect { get(:show, { params: { id: product.id } }) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  # Regression test for #75
  describe 'on :show to a product in the wrong store' do
    let!(:store_1) { FactoryBot.create(:store) }
    let!(:store_2) { FactoryBot.create(:store) }

    before(:each) do
      product.stores << store_1
    end

    it 'should raise ActiveRecord::RecordNotFound' do
      controller.stub(current_store: store_2)
      expect { get(:show, { params: { id: product.id } }) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'on :show to a product w/ store' do
    let!(:store) { FactoryBot.create(:store) }

    before(:each) do
      product.stores << store
    end

    it 'should return 301' do
      controller.stub(current_store: store)
      get(:show, { params: { id: product.id } })

      expect(response.status).to eq 301
    end
  end

  describe 'on :index w/ store and a taxonomy' do
    let!(:taxonomy) { FactoryBot.create(:taxonomy, store: Spree::Store.default) }
    let!(:taxonomy2) { FactoryBot.create(:taxonomy) }

    before do
      get :index
    end

    it 'should return 200' do
      expect(response.status).to eq 200
    end

    it 'should have proper taxonomy' do
      @controller.view_assigns['taxonomies'].includes taxonomy
    end
  end
end

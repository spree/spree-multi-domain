require 'spec_helper'

describe Spree::HomeController do
  describe 'on :index w/ store and a taxonomy' do
    let!(:taxonomy) { FactoryBot.create(:taxonomy, store: Spree::Store.default) }
    let!(:taxonomy2) { FactoryBot.create(:taxonomy) }

    before do
      spree_get :index
    end

    it 'should return 200' do
      expect(response.status).to eq 200
    end

    it 'should have a proper taxonomy' do
      @controller.view_assigns['taxonomies'].includes taxonomy
    end
  end
end

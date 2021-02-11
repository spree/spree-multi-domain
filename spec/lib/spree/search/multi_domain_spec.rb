# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Spree::Search::MultiDomain do
  describe '#retrieve_products' do
    subject { described_class.new(params).retrieve_products }

    context 'store id is given in params' do
      let(:eu_store) { create(:store, name: 'EU Store', default_currency: 'EUR') }
      let(:uk_store) { create(:store, name: 'UK Store', default_currency: 'GBP') }
      let(:spree_store) { create(:store, name: 'Spree Demo Site', default_currency: 'USD', default: true) }

      let!(:products_for_eu_store) do
        (1..3).each do |v|
          create(:product, name: "P-EU-#{v}", stores: [eu_store])
        end
      end

      let!(:products_for_uk_store) do
        (1..2).each do |v|
          create(:product, name: "P-UK-#{v}", stores: [uk_store])
        end
      end

      let!(:product_for_spree_store) { create(:product, name: 'P-Spree-1', stores: [spree_store]) }

      context 'when EU Store' do
        let(:params) { { current_store_id: eu_store.id } }

        it 'should return 3 products' do
          expect(subject.count).to eq(3)
        end

        it 'returns only products from EU store' do
          expect(subject.map(&:name)).to include('P-EU-1', 'P-EU-2', 'P-EU-3')
        end

        it 'does not return products for UK and Spree Store' do
          expect(subject.map(&:name)).not_to include('P-UK-1', 'P-UK-2', 'P-Spree-1')
        end
      end

      context 'when UK Store' do
        let(:params) { { current_store_id: uk_store.id } }

        it 'should return 2 products' do
          expect(subject.count).to eq(2)
        end

        it 'returns only products from UK store' do
          expect(subject.map(&:name)).to include('P-UK-1', 'P-UK-2')
        end

        it 'does not return products for EU and Spree Store' do
          expect(subject.map(&:name)).not_to include('P-EU-1', 'P-EU-2', 'P-EU-3', 'P-Spree-1')
        end
      end

      context 'when Spree Store' do
        let(:params) { { current_store_id: spree_store.id } }

        it 'should return 1 products' do
          expect(subject.count).to eq(1)
        end

        it 'returns only products from Spree store' do
          expect(subject.map(&:name)).to include('P-Spree-1')
        end

        it 'does not return products for EU and UK Store' do
          expect(subject.map(&:name)).not_to include('P-EU-1', 'P-EU-2', 'P-EU-3', 'P-UK-1', 'P-UK-2')
        end
      end
    end

    context 'store id is not given in params' do
      let(:params) { { current_store_id: nil } }

      it 'returns all products' do
        expect(subject.count).to eq(0)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

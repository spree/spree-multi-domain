require 'spec_helper'

describe Spree::Store do

  before(:each) do
    @store = FactoryGirl.create(:store, :domains => "website1.com\nwww.subdomain.com")
    @store2 = FactoryGirl.create(:store, :domains => 'freethewhales.com')
  end

  it "should find stores by domain" do
    by_domain = Spree::Store.by_domain('www.subdomain.com').all

    by_domain.should include(@store)
    by_domain.should_not include(@store2)
  end

  describe '#skip_validations' do
    let(:store_without_data) { Spree::Store.new }

    context 'when returns false' do
      it { expect(store_without_data).to_not be_valid }
    end

    context 'when returns true' do
      before { store_without_data.stub(:skip_validations).and_return(true) }

      it { store_without_data.should be_valid }
    end
  end
end

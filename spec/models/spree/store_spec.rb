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

end
require 'spec_helper'

describe Spree::Store do

  before(:each) do
    @store = FactoryGirl.create(:store, :domains => "website1.com, www.subdomain.com")
    @store2 = FactoryGirl.create(:store, :domains => "freethewhales.com, whalesrule.com")
    @store3 = FactoryGirl.create(:store, :domains => "whales.com")
  end

  it "should find stores by domain" do
    by_domain = Spree::Store.by_domain('www.subdomain.com').all

    by_domain.should include(@store)
    by_domain.should_not include(@store2)
    by_domain.should_not include(@store3)
  end

  it "matches the entire domain" do
    by_domain = Spree::Store.by_domain('whales.com').all

    by_domain.should include(@store3)
    by_domain.should_not include(@store)
    by_domain.should_not include(@store2)
  end

  it "matches the suffix" do
    by_domain = Spree::Store.by_domain('whales.co').all

    by_domain.should_not include(@store3)
    by_domain.should_not include(@store)
    by_domain.should_not include(@store2)
  end
end

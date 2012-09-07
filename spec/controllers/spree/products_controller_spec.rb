require 'spec_helper'

describe Spree::ProductsController do

  before do
    controller.stub :current_user => FactoryGirl.create(:user)
  end

  describe 'on :show to a product w/out correct store' do
    before(:each) do
      @store = FactoryGirl.create(:store)
      @product = FactoryGirl.create(:product)
    end

    it 'should return 404' do
      get :show, :id => @product.permalink, :use_route => :spree

      response.response_code.should == 404
    end


  end

  describe 'on :show to a product w/ store' do
    before(:each) do
      @store = FactoryGirl.create(:store)
      @product = FactoryGirl.create(:product, :stores => [@store])
    end

    it 'should return 200' do
      get :show, :id => @product.permalink, :use_route => :spree

      response.response_code.should == 200
    end
  end
end

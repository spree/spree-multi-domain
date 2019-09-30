require 'spec_helper'

describe "Template renderer with dynamic layouts" do
  it "should render the layout corresponding to the current store" do
    create :store, code: 'my_store', name: 'Spree Test Store'

    get "http://www.example.com"

    response.body.should include("Spree Test Store")
  end

  it "should fall back to the default layout if none are found for the current store" do
    ApplicationController.stub(:current_store).and_return(nil)

    get "http://www.example.com"
    response.body.should include("Spree Demo Site")
  end
end

require 'spec_helper'

describe Spree::Admin::StoresController do
  stub_authorization!

  let!(:store)          { FactoryBot.create(:store) }
  let(:image_file)      { Rack::Test::UploadedFile.new(SpreeMultiDomain::Engine.root.join('spec', 'fixtures', 'thinking-cat.jpg')) }
  let(:store_with_logo) { FactoryBot.create(:store, logo: image_file) }

  describe "on :index" do
    it "renders index" do
      get :index
      expect(response.status).to be 200
    end
  end

  context 'update' do
    it 'can update logo' do
      spree_put :update, id: store.to_param, store: { logo: image_file }

      expect(store.reload.logo_file_name).to eq image_file.original_filename
    end
  end
end

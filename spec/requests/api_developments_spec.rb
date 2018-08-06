require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do
  describe "RDBMS-backed" do
    before(:each) {Foo.delete_all}
    after(:each) {Foo.delete_all}

    it "create RDBMS-backed model" do
      object=Foo.create(:name=>"test")
      expect(Foo.find(object.id).name).to eq("test")
    end
    it "expose RDBMS-backed Api resource" do
      object=Foo.create(:name=>"test")
      get foo_path(object.id)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["name"]).to eq("test")
    end
  end

  describe "MOngoDB-backed" do
    before(:each) {Bar.delete_all}
    after(:each) {Bar.delete_all}

    it "create MongoDB-backed model" do
      object=Bar.create(:name=>"test")
      expect(Bar.find(object.id).name).to eq("test")
    end
    it "expose MongoDB-backed Api resource" do
      object=Bar.create(:name=>"test")
      get bar_path(object.id)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["name"]).to eq("test")
    end
  end
end

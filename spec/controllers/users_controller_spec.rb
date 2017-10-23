require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    User.delete_all
    @john_doe = FactoryGirl.create(:user)
    @john_kennedy = FactoryGirl.create(:user, short_name: 'JK', surname: 'Kennedy')
  end
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'filters on short_name' do
      get :index, params: { short_name: 'JD'}
      puts "json response body #{JSON.parse(response.body)["items"]}"
      expect(JSON.parse(response.body)["items"].size).to eq(1)
    end

    it 'filters on surname starts_with' do
      get :index, params: { starts_with: 'Kenne'}
      expect(JSON.parse(response.body)["items"].size).to eq(1)
    end
    
    it 'filters both on surname starts_with and short_name' do
      get :index, params: { short_name: 'JK', starts_with: 'Kenne'}
      expect(JSON.parse(response.body)["items"].size).to eq(1)
      get :index, params: { short_name: 'JK', starts_with: 'DOE'}
      expect(JSON.parse(response.body)["items"].size).to eq(0)
    end
  end
  # Query users
  # http://example.com/products?status=active&starts_with=Ruby
end

require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do

    it 'JSON Schema' do
      get '/customers/1.json'
      expect(response).to match_response_schema("customer")
    end

    it "works! 200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "Index - JSON " do
      get "/customers.json"
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String),
      ]) 
    end

    it "Show - JSON" do
      get "/customers/1.json"
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String),
      ) 
    end

    it "Show - JSON.parse" do
      get "/customers/1.json"
      response_body = JSON.parse(response.body)

      expect(response_body["id"]).to eq(1)
      expect(response_body["name"]).to be_kind_of(String)
      expect(response_body["email"]).to be_kind_of(String)
    end

    it "Create - JSON" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      customers_params = attributes_for(:customer)

      post "/customers", params: { customer: customers_params }, headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: customers_params.fetch(:name),
        # or customers_params[:name]
        email: customers_params.fetch(:email),
        # or customers_params[:email]
      )   
    end

    it "Update - JSON" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      customers = Customer.first

      customers.name += "- Atualizado"

      patch "/customers/#{customers.id}.json", params: { customer: customers.attributes }, headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: customers.name,
        email: customers.email,
      )   
    end

    it "Delete - JSON" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      customers = Customer.first  

      expect{ delete "/customers/#{customers.id}.json",  headers: headers }.to change(Customer, :count).by(-1)
      
      expect(response).to have_http_status(204)
    end
  end
end

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

    describe "As a Guest" do
        context "#index" do
            it 'reponds successfully' do
                get :index
                expect(response).to be_success
            end
            
            it 'reponds a 200 reponse' do
                get :index
                expect(response).to have_http_status(200)
            end  
        end
    
        context "#Show" do
            it 'reponds a 302 reponse' do
                customer = create(:customer)
                get :show, params: { id: customer.id }
                expect(response).to have_http_status(302)
            end 
        end
    end

    describe "As logged member" do

        before do 
            @member = create(:member)
            @customer = create(:customer)
        end

        it "Route" do
            is_expected.to route(:get, "/customers").to(action: :index) 
        end

        context "Content Type JSON" do
            it "#show" do
                sign_in @member
                get :show, format: :json, params: { id: @customer.id }
    
                expect(response.content_type).to eq("application/json")
            end
    
            it "#post" do
                customer_params = attributes_for(:customer)
                sign_in @member
    
                get :create, format: :json, params: { customer: customer_params }
    
                expect(response.content_type).to eq("application/json")
            end
        end

        it "Flash Notices" do
            customer_params = attributes_for(:customer)
            sign_in @member

            post :create, params: { customer: customer_params }
            expect(flash[:notice]).to match(/successfully created/)
        end

        context "Valid attributes?" do
            it "#true" do
                customer_params = attributes_for(:customer)
                sign_in @member
                
                expect {
                    post :create, params: { customer: customer_params }
                }.to change(Customer, :count).by(1) 
            end
    
            it "#false" do
                customer_params = attributes_for(:customer, address: nil)
                sign_in @member
                
                expect {
                    post :create, params: { customer: customer_params }
                }.not_to change(Customer, :count) 
            end 
        end

        it "reponds a 200 reponse" do
            sign_in @member
    
            get :show, params: { id: @customer.id }
            expect(response).to have_http_status(200) 
        end

        it "render a :show template" do
            sign_in @member
    
            get :show, params: { id: @customer.id }
            expect(response).to render_template(:show)
        end
    end
end

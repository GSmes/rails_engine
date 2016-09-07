require "rails_helper"

RSpec.describe Api::V1::InvoicesController do
  describe "GET index" do
    it "assigns @invoices" do
      10.times do 
        FactoryGirl.create(:invoice)
      end
      get :index, format: :json
      expect(assigns(:invoices).count).to eq(10)
    end
    
    xit "returns all invoices in JSON format" do
    end
  end
  
  describe "GET show" do
    it "retrieves the correct @invoice" do
      FactoryGirl.create(:invoice, id: 1, status: "bling")
      FactoryGirl.create(:invoice, id: 2, status: "boring")
      
      get :show, params: { id: 1, format: :json }
      expect(assigns(:invoice).status).to eq("bling")
    end
  end
  
  describe "GET random" do
    it "retrieves a random @invoice" do
      200.times do |n|
        FactoryGirl.create(:invoice, id: n)
      end
      get :random, params: { format: :json }
      first_random_invoice = assigns(:invoice)
      
      get :random, params: { format: :json }
      second_random_invoice = assigns(:invoice)
      
      expect(first_random_invoice).to_not eq(second_random_invoice)
    end
  end
end
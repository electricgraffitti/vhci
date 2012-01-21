require 'spec_helper'

describe PaymentAccuracyController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'claim_editing'" do
    it "returns http success" do
      get 'claim_editing'
      response.should be_success
    end
  end

  describe "GET 'fraud_prevention'" do
    it "returns http success" do
      get 'fraud_prevention'
      response.should be_success
    end
  end

  describe "GET 'bill_review'" do
    it "returns http success" do
      get 'bill_review'
      response.should be_success
    end
  end

  describe "GET 'about_us'" do
    it "returns http success" do
      get 'about_us'
      response.should be_success
    end
  end

  describe "GET 'nucleus'" do
    it "returns http success" do
      get 'nucleus'
      response.should be_success
    end
  end

end

require 'spec_helper'

describe PagesController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'public_sector'" do
    it "should be successful" do
      get 'public_sector'
      response.should be_success
    end
  end

  describe "GET 'private_sector'" do
    it "should be successful" do
      get 'private_sector'
      response.should be_success
    end
  end

  describe "GET 'property_casualty'" do
    it "should be successful" do
      get 'property_casualty'
      response.should be_success
    end
  end

  describe "GET 'careers'" do
    it "should be successful" do
      get 'careers'
      response.should be_success
    end
  end

  describe "GET 'social_media'" do
    it "should be successful" do
      get 'social_media'
      response.should be_success
    end
  end

  describe "GET 'press_kit'" do
    it "should be successful" do
      get 'press_kit'
      response.should be_success
    end
  end

  describe "GET 'partners'" do
    it "should be successful" do
      get 'partners'
      response.should be_success
    end
  end

  describe "GET 'accreditations'" do
    it "should be successful" do
      get 'accreditations'
      response.should be_success
    end
  end

  describe "GET 'nucleus'" do
    it "should be successful" do
      get 'nucleus'
      response.should be_success
    end
  end

  describe "GET 'markets'" do
    it "should be successful" do
      get 'markets'
      response.should be_success
    end
  end

  describe "GET 'PCI'" do
    it "should be successful" do
      get 'PCI'
      response.should be_success
    end
  end

  describe "GET 'DCI'" do
    it "should be successful" do
      get 'DCI'
      response.should be_success
    end
  end

  describe "GET 'OCI'" do
    it "should be successful" do
      get 'OCI'
      response.should be_success
    end
  end

  describe "GET 'OldPublicSector'" do
    it "should be successful" do
      get 'OldPublicSector'
      response.should be_success
    end
  end

  describe "GET 'OldPrivateSector'" do
    it "should be successful" do
      get 'OldPrivateSector'
      response.should be_success
    end
  end

  describe "GET 'OldPandC'" do
    it "should be successful" do
      get 'OldPandC'
      response.should be_success
    end
  end

  describe "GET 'OldAboutUs'" do
    it "should be successful" do
      get 'OldAboutUs'
      response.should be_success
    end
  end

  describe "GET 'OldCareers'" do
    it "should be successful" do
      get 'OldCareers'
      response.should be_success
    end
  end

  describe "GET 'OldServices'" do
    it "should be successful" do
      get 'OldServices'
      response.should be_success
    end
  end

end

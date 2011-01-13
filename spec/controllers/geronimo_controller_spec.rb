require 'spec_helper'

describe GeronimoController do
  render_views
  
  describe "Get 'index'" do
    it "should resond success" do
      get :index
      response.should be_success
    end
	
	it "should have title geronimo" do
      get :index
      response.should have_selector('title', :content => "Geronimo!")
    end
  end
end
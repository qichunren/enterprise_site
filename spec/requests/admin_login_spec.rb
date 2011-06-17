require 'spec_helper'

describe "AdminSessions" do
  describe "GET /admin_login" do
    it "works! " do
      get admin_login_path
      response.status.should be(200)
    end
  end
  
  describe "POST /admin_login" do
    it "works!" do
      post "/admin_login"
      response.should be_success
    end
  end
  
end

require 'spec_helper'

describe "root page" do
  describe "GET /" do
    it "works! " do
      get root_path
      response.status.should be(200)
    end
  end
  
end

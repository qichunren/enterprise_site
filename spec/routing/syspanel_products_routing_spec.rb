# encoding: utf-8
require "spec_helper"

describe Syspanel::ProductsController do
  describe "routing" do
    it "recognizes and generates #settings" do
      {:get => "/syspanel/products/settings"}.should route_to(:controller => "syspanel/products", :action => "settings")
    end
  end
end
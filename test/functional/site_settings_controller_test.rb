require 'test_helper'

class SiteSettingsControllerTest < ActionController::TestCase
  setup do
    @site_setting = site_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_setting" do
    assert_difference('SiteSetting.count') do
      post :create, :site_setting => @site_setting.attributes
    end

    assert_redirected_to site_setting_path(assigns(:site_setting))
  end

  test "should show site_setting" do
    get :show, :id => @site_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @site_setting.to_param
    assert_response :success
  end

  test "should update site_setting" do
    put :update, :id => @site_setting.to_param, :site_setting => @site_setting.attributes
    assert_redirected_to site_setting_path(assigns(:site_setting))
  end

  test "should destroy site_setting" do
    assert_difference('SiteSetting.count', -1) do
      delete :destroy, :id => @site_setting.to_param
    end

    assert_redirected_to site_settings_path
  end
end

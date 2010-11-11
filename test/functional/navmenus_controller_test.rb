require 'test_helper'

class NavmenusControllerTest < ActionController::TestCase
  setup do
    @navmenu = navmenus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:navmenus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create navmenu" do
    assert_difference('Navmenu.count') do
      post :create, :navmenu => @navmenu.attributes
    end

    assert_redirected_to navmenu_path(assigns(:navmenu))
  end

  test "should show navmenu" do
    get :show, :id => @navmenu.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @navmenu.to_param
    assert_response :success
  end

  test "should update navmenu" do
    put :update, :id => @navmenu.to_param, :navmenu => @navmenu.attributes
    assert_redirected_to navmenu_path(assigns(:navmenu))
  end

  test "should destroy navmenu" do
    assert_difference('Navmenu.count', -1) do
      delete :destroy, :id => @navmenu.to_param
    end

    assert_redirected_to navmenus_path
  end
end

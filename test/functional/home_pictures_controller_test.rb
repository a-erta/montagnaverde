require 'test_helper'

class HomePicturesControllerTest < ActionController::TestCase
  setup do
    @home_picture = home_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_picture" do
    assert_difference('HomePicture.count') do
      post :create, home_picture: {  }
    end

    assert_redirected_to home_picture_path(assigns(:home_picture))
  end

  test "should show home_picture" do
    get :show, id: @home_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_picture
    assert_response :success
  end

  test "should update home_picture" do
    put :update, id: @home_picture, home_picture: {  }
    assert_redirected_to home_picture_path(assigns(:home_picture))
  end

  test "should destroy home_picture" do
    assert_difference('HomePicture.count', -1) do
      delete :destroy, id: @home_picture
    end

    assert_redirected_to home_pictures_path
  end
end

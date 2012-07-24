require 'test_helper'

class FbChannelsControllerTest < ActionController::TestCase
  setup do
    @fb_channel = fb_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fb_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fb_channel" do
    assert_difference('FbChannel.count') do
      post :create, fb_channel: {  }
    end

    assert_redirected_to fb_channel_path(assigns(:fb_channel))
  end

  test "should show fb_channel" do
    get :show, id: @fb_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fb_channel
    assert_response :success
  end

  test "should update fb_channel" do
    put :update, id: @fb_channel, fb_channel: {  }
    assert_redirected_to fb_channel_path(assigns(:fb_channel))
  end

  test "should destroy fb_channel" do
    assert_difference('FbChannel.count', -1) do
      delete :destroy, id: @fb_channel
    end

    assert_redirected_to fb_channels_path
  end
end

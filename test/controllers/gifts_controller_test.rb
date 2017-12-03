require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gift = gifts(:one)
  end

  test "should get index" do
    get gifts_url, as: :json
    assert_response :success
  end

  test "should create gift" do
    assert_difference('Gift.count') do
      post gifts_url, params: { gift: { image_url: @gift.image_url, subtitle: @gift.subtitle, title: @gift.title, url: @gift.url } }, as: :json
    end

    assert_response 201
  end

  test "should show gift" do
    get gift_url(@gift), as: :json
    assert_response :success
  end

  test "should update gift" do
    patch gift_url(@gift), params: { gift: { image_url: @gift.image_url, subtitle: @gift.subtitle, title: @gift.title, url: @gift.url } }, as: :json
    assert_response 200
  end

  test "should destroy gift" do
    assert_difference('Gift.count', -1) do
      delete gift_url(@gift), as: :json
    end

    assert_response 204
  end
end

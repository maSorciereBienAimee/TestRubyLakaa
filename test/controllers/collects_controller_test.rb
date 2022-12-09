require "test_helper"

class CollectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collect = collects(:one)
  end

  test "should get index" do
    get collects_url, as: :json
    assert_response :success
  end

  test "should create collect" do
    assert_difference('Collect.count') do
      post collects_url, params: { collect: { asso: @collect.asso, at: @collect.at, other: @collect.other } }, as: :json
    end

    assert_response 201
  end

  test "should show collect" do
    get collect_url(@collect), as: :json
    assert_response :success
  end

  test "should update collect" do
    patch collect_url(@collect), params: { collect: { asso: @collect.asso, at: @collect.at, other: @collect.other } }, as: :json
    assert_response 200
  end

  test "should destroy collect" do
    assert_difference('Collect.count', -1) do
      delete collect_url(@collect), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class DesiredsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desired = desireds(:one)
  end

  test "should get index" do
    get desireds_url, as: :json
    assert_response :success
  end

  test "should create desired" do
    assert_difference('Desired.count') do
      post desireds_url, params: { desired: { comment: @desired.comment, description: @desired.description, image: @desired.image, imdbid: @desired.imdbid, name: @desired.name, score: @desired.score } }, as: :json
    end

    assert_response 201
  end

  test "should show desired" do
    get desired_url(@desired), as: :json
    assert_response :success
  end

  test "should update desired" do
    patch desired_url(@desired), params: { desired: { comment: @desired.comment, description: @desired.description, image: @desired.image, imdbid: @desired.imdbid, name: @desired.name, score: @desired.score } }, as: :json
    assert_response 200
  end

  test "should destroy desired" do
    assert_difference('Desired.count', -1) do
      delete desired_url(@desired), as: :json
    end

    assert_response 204
  end
end

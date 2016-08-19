require 'test_helper'

class GoompsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goomp = create :goomp
    @user = create :user
    sign_in @user
  end

  test "should get index" do
    get goomps_url
    assert_response :success
  end

  test "should get new" do
    get new_goomp_url
    assert_response :success
  end

  test "should create and auto-join goomp" do
    assert_difference('Goomp.count') do
      post goomps_url, params: { goomp: attributes_for(:goomp) }
    end
    new_goomp = Goomp.last

    assert @user.joined? new_goomp
    assert_redirected_to goomp_url(new_goomp)
  end

  test "should show goomp" do
    get goomp_url(@goomp)
    assert_response :success
  end

  test "should get edit" do
    get edit_goomp_url(@goomp)
    assert_response :success
  end

  test "should update goomp" do
    patch goomp_url(@goomp), params: { goomp: attributes_for(:goomp) }
    assert_redirected_to goomp_url(@goomp)
  end

  test "should destroy goomp" do
    assert_difference('Goomp.count', -1) do
      delete goomp_url(@goomp)
    end

    assert_redirected_to goomps_url
  end
end

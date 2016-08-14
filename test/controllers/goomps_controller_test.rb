require 'test_helper'

class GoompsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goomp = goomps(:one)
  end

  test "should get index" do
    get goomps_url
    assert_response :success
  end

  test "should get new" do
    get new_goomp_url
    assert_response :success
  end

  test "should create goomp" do
    assert_difference('Goomp.count') do
      post goomps_url, params: { goomp: { cover: @goomp.cover, description: @goomp.description, memberships_count: @goomp.memberships_count, name: @goomp.name, price: @goomp.price, slug: @goomp.slug, user_id: @goomp.user_id } }
    end

    assert_redirected_to goomp_url(Goomp.last)
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
    patch goomp_url(@goomp), params: { goomp: { cover: @goomp.cover, description: @goomp.description, memberships_count: @goomp.memberships_count, name: @goomp.name, price: @goomp.price, slug: @goomp.slug, user_id: @goomp.user_id } }
    assert_redirected_to goomp_url(@goomp)
  end

  test "should destroy goomp" do
    assert_difference('Goomp.count', -1) do
      delete goomp_url(@goomp)
    end

    assert_redirected_to goomps_url
  end
end

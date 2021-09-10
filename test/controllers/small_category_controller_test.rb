require 'test_helper'

class SmallCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get small_category_index_url
    assert_response :success
  end

  test "should get new" do
    get small_category_new_url
    assert_response :success
  end

  test "should get create" do
    get small_category_create_url
    assert_response :success
  end

  test "should get edit" do
    get small_category_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get small_category_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class LargeCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get large_category_index_url
    assert_response :success
  end

  test "should get create" do
    get large_category_create_url
    assert_response :success
  end

  test "should get edit" do
    get large_category_edit_url
    assert_response :success
  end

  test "should get destory" do
    get large_category_destory_url
    assert_response :success
  end

end

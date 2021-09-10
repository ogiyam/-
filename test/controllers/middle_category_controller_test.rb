require 'test_helper'

class MiddleCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get middle_category_index_url
    assert_response :success
  end

  test "should get create" do
    get middle_category_create_url
    assert_response :success
  end

  test "should get edit" do
    get middle_category_edit_url
    assert_response :success
  end

  test "should get destory" do
    get middle_category_destory_url
    assert_response :success
  end

end

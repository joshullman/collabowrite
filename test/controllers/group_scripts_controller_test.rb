require 'test_helper'

class GroupScriptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_script = group_scripts(:one)
  end

  test "should get index" do
    get group_scripts_url
    assert_response :success
  end

  test "should get new" do
    get new_group_script_url
    assert_response :success
  end

  test "should create group_script" do
    assert_difference('GroupScript.count') do
      post group_scripts_url, params: { group_script: {  } }
    end

    assert_redirected_to group_script_url(GroupScript.last)
  end

  test "should show group_script" do
    get group_script_url(@group_script)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_script_url(@group_script)
    assert_response :success
  end

  test "should update group_script" do
    patch group_script_url(@group_script), params: { group_script: {  } }
    assert_redirected_to group_script_url(@group_script)
  end

  test "should destroy group_script" do
    assert_difference('GroupScript.count', -1) do
      delete group_script_url(@group_script)
    end

    assert_redirected_to group_scripts_url
  end
end

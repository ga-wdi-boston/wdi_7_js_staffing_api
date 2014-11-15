require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  setup do
    @skill = skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skills)
  end

  test "should create skill" do
    assert_difference('Skill.count') do
      post :create, skill: { name: @skill.name, users: @skill.users }
    end

    assert_response 201
  end

  test "should show skill" do
    get :show, id: @skill
    assert_response :success
  end

  test "should update skill" do
    put :update, id: @skill, skill: { name: @skill.name, users: @skill.users }
    assert_response 204
  end

  test "should destroy skill" do
    assert_difference('Skill.count', -1) do
      delete :destroy, id: @skill
    end

    assert_response 204
  end
end

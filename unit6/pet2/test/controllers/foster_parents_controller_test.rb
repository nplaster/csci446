require 'test_helper'

class FosterParentsControllerTest < ActionController::TestCase
  setup do
    @foster_parent = foster_parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foster_parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foster_parent" do
    assert_difference('FosterParent.count', 0) do
      post :create, foster_parent: { address: @foster_parent.address, animal_id: @foster_parent.animal_id, email: @foster_parent.email, name: @foster_parent.name }
    end

    assert_redirected_to store_path
  end
  test "should show foster_parent" do
    get :show, id: @foster_parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foster_parent
    assert_response :success
  end

  test "should update foster_parent" do
    patch :update, id: @foster_parent, foster_parent: { address: @foster_parent.address, animal_id: @foster_parent.animal_id, email: @foster_parent.email, name: @foster_parent.name }
    assert_redirected_to foster_parent_path(assigns(:foster_parent))
  end

end

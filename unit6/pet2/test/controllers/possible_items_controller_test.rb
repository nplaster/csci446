require 'test_helper'

class PossibleItemsControllerTest < ActionController::TestCase
  setup do
    @possible_item = possible_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:possible_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create possible_item" do
    assert_difference('PossibleItem.count') do
      post :create, animal_id: animals(:bunny).id
    end
    assert_redirected_to cart_path(assigns(:possible_item).consider)
  end

  test "should show possible_item" do
    get :show, id: @possible_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @possible_item
    assert_response :success
  end

  test "should update possible_item" do
    patch :update, id: @possible_item, possible_item: { animal_id: @possible_item.animal_id, consider_id: @possible_item.consider_id }
    assert_redirected_to possible_item_path(assigns(:possible_item))
  end

  test "should destroy possible_item" do
    assert_difference('PossibleItem.count', -1) do
      delete :destroy, id: @possible_item
    end

    assert_redirected_to possible_items_path
  end
end

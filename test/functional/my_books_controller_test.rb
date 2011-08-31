require 'test_helper'

class MyBooksControllerTest < ActionController::TestCase
  setup do
    @my_book = my_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_book" do
    assert_difference('MyBook.count') do
      post :create, :my_book => @my_book.attributes
    end

    assert_redirected_to my_book_path(assigns(:my_book))
  end

  test "should show my_book" do
    get :show, :id => @my_book.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @my_book.to_param
    assert_response :success
  end

  test "should update my_book" do
    put :update, :id => @my_book.to_param, :my_book => @my_book.attributes
    assert_redirected_to my_book_path(assigns(:my_book))
  end

  test "should destroy my_book" do
    assert_difference('MyBook.count', -1) do
      delete :destroy, :id => @my_book.to_param
    end

    assert_redirected_to my_books_path
  end
end

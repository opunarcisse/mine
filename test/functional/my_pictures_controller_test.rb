require 'test_helper'

class MyPicturesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => MyPicture.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    MyPicture.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    MyPicture.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to my_picture_url(assigns(:my_picture))
  end
  
  def test_edit
    get :edit, :id => MyPicture.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    MyPicture.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MyPicture.first
    assert_template 'edit'
  end
  
  def test_update_valid
    MyPicture.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MyPicture.first
    assert_redirected_to my_picture_url(assigns(:my_picture))
  end
  
  def test_destroy
    my_picture = MyPicture.first
    delete :destroy, :id => my_picture
    assert_redirected_to my_pictures_url
    assert !MyPicture.exists?(my_picture.id)
  end
end

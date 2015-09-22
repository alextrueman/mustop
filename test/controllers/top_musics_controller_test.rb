require 'test_helper'

class TopMusicsControllerTest < ActionController::TestCase
  setup do
    @top_music = top_musics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_musics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_music" do
    assert_difference('TopMusic.count') do
      post :create, top_music: { name: @top_music.name, picture: @top_music.picture, title: @top_music.title }
    end

    assert_redirected_to top_music_path(assigns(:top_music))
  end

  test "should show top_music" do
    get :show, id: @top_music
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_music
    assert_response :success
  end

  test "should update top_music" do
    patch :update, id: @top_music, top_music: { name: @top_music.name, picture: @top_music.picture, title: @top_music.title }
    assert_redirected_to top_music_path(assigns(:top_music))
  end

  test "should destroy top_music" do
    assert_difference('TopMusic.count', -1) do
      delete :destroy, id: @top_music
    end

    assert_redirected_to top_musics_path
  end
end

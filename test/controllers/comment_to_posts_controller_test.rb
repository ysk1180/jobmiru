require 'test_helper'

class CommentToPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_to_post = comment_to_posts(:one)
  end

  test "should get index" do
    get comment_to_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_to_post_url
    assert_response :success
  end

  test "should create comment_to_post" do
    assert_difference('CommentToPost.count') do
      post comment_to_posts_url, params: { comment_to_post: { comment_to_post_content: @comment_to_post.comment_to_post_content, post_id: @comment_to_post.post_id, user_id: @comment_to_post.user_id } }
    end

    assert_redirected_to comment_to_post_url(CommentToPost.last)
  end

  test "should show comment_to_post" do
    get comment_to_post_url(@comment_to_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_to_post_url(@comment_to_post)
    assert_response :success
  end

  test "should update comment_to_post" do
    patch comment_to_post_url(@comment_to_post), params: { comment_to_post: { comment_to_post_content: @comment_to_post.comment_to_post_content, post_id: @comment_to_post.post_id, user_id: @comment_to_post.user_id } }
    assert_redirected_to comment_to_post_url(@comment_to_post)
  end

  test "should destroy comment_to_post" do
    assert_difference('CommentToPost.count', -1) do
      delete comment_to_post_url(@comment_to_post)
    end

    assert_redirected_to comment_to_posts_url
  end
end

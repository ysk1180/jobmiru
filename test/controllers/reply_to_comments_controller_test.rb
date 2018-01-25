require 'test_helper'

class ReplyToCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reply_to_comment = reply_to_comments(:one)
  end

  test "should get index" do
    get reply_to_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_reply_to_comment_url
    assert_response :success
  end

  test "should create reply_to_comment" do
    assert_difference('ReplyToComment.count') do
      post reply_to_comments_url, params: { reply_to_comment: { comment_to_post_id: @reply_to_comment.comment_to_post_id, post_id: @reply_to_comment.post_id, reply_to_comment_content: @reply_to_comment.reply_to_comment_content, user_id: @reply_to_comment.user_id } }
    end

    assert_redirected_to reply_to_comment_url(ReplyToComment.last)
  end

  test "should show reply_to_comment" do
    get reply_to_comment_url(@reply_to_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_reply_to_comment_url(@reply_to_comment)
    assert_response :success
  end

  test "should update reply_to_comment" do
    patch reply_to_comment_url(@reply_to_comment), params: { reply_to_comment: { comment_to_post_id: @reply_to_comment.comment_to_post_id, post_id: @reply_to_comment.post_id, reply_to_comment_content: @reply_to_comment.reply_to_comment_content, user_id: @reply_to_comment.user_id } }
    assert_redirected_to reply_to_comment_url(@reply_to_comment)
  end

  test "should destroy reply_to_comment" do
    assert_difference('ReplyToComment.count', -1) do
      delete reply_to_comment_url(@reply_to_comment)
    end

    assert_redirected_to reply_to_comments_url
  end
end

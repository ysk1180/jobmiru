require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { challenge: @post.challenge, company_name: @post.company_name, division_name: @post.division_name, experience_year: @post.experience_year, id: @post.id, income: @post.income, industry: @post.industry, job_category: @post.job_category, job_content: @post.job_content, job_title: @post.job_title, join_reason: @post.join_reason, leave_reason: @post.leave_reason, obtained_skill: @post.obtained_skill, reward: @post.reward, user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { challenge: @post.challenge, company_name: @post.company_name, division_name: @post.division_name, experience_year: @post.experience_year, id: @post.id, income: @post.income, industry: @post.industry, job_category: @post.job_category, job_content: @post.job_content, job_title: @post.job_title, join_reason: @post.join_reason, leave_reason: @post.leave_reason, obtained_skill: @post.obtained_skill, reward: @post.reward, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end

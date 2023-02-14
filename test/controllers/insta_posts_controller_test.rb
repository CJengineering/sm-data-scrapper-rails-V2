require "test_helper"

class InstaPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insta_post = insta_posts(:one)
  end

  test "should get index" do
    get insta_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_insta_post_url
    assert_response :success
  end

  test "should create insta_post" do
    assert_difference("InstaPost.count") do
      post insta_posts_url, params: { insta_post: { comments_count: @insta_post.comments_count, id_media: @insta_post.id_media, impressions: @insta_post.impressions, like_count: @insta_post.like_count, media_type: @insta_post.media_type, media_url: @insta_post.media_url, reach: @insta_post.reach, timestamp: @insta_post.timestamp } }
    end

    assert_redirected_to insta_post_url(InstaPost.last)
  end

  test "should show insta_post" do
    get insta_post_url(@insta_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_insta_post_url(@insta_post)
    assert_response :success
  end

  test "should update insta_post" do
    patch insta_post_url(@insta_post), params: { insta_post: { comments_count: @insta_post.comments_count, id_media: @insta_post.id_media, impressions: @insta_post.impressions, like_count: @insta_post.like_count, media_type: @insta_post.media_type, media_url: @insta_post.media_url, reach: @insta_post.reach, timestamp: @insta_post.timestamp } }
    assert_redirected_to insta_post_url(@insta_post)
  end

  test "should destroy insta_post" do
    assert_difference("InstaPost.count", -1) do
      delete insta_post_url(@insta_post)
    end

    assert_redirected_to insta_posts_url
  end
end

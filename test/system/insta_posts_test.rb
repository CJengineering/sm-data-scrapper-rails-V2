require "application_system_test_case"

class InstaPostsTest < ApplicationSystemTestCase
  setup do
    @insta_post = insta_posts(:one)
  end

  test "visiting the index" do
    visit insta_posts_url
    assert_selector "h1", text: "Insta posts"
  end

  test "should create insta post" do
    visit insta_posts_url
    click_on "New insta post"

    fill_in "Comments count", with: @insta_post.comments_count
    fill_in "Id media", with: @insta_post.id_media
    fill_in "Impressions", with: @insta_post.impressions
    fill_in "Like count", with: @insta_post.like_count
    fill_in "Media type", with: @insta_post.media_type
    fill_in "Media url", with: @insta_post.media_url
    fill_in "Reach", with: @insta_post.reach
    fill_in "Timestamp", with: @insta_post.timestamp
    click_on "Create Insta post"

    assert_text "Insta post was successfully created"
    click_on "Back"
  end

  test "should update Insta post" do
    visit insta_post_url(@insta_post)
    click_on "Edit this insta post", match: :first

    fill_in "Comments count", with: @insta_post.comments_count
    fill_in "Id media", with: @insta_post.id_media
    fill_in "Impressions", with: @insta_post.impressions
    fill_in "Like count", with: @insta_post.like_count
    fill_in "Media type", with: @insta_post.media_type
    fill_in "Media url", with: @insta_post.media_url
    fill_in "Reach", with: @insta_post.reach
    fill_in "Timestamp", with: @insta_post.timestamp
    click_on "Update Insta post"

    assert_text "Insta post was successfully updated"
    click_on "Back"
  end

  test "should destroy Insta post" do
    visit insta_post_url(@insta_post)
    click_on "Destroy this insta post", match: :first

    assert_text "Insta post was successfully destroyed"
  end
end

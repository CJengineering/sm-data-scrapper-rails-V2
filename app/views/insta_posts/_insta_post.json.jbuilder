json.extract! insta_post, :id, :like_count, :media_type, :media_url, :timestamp, :comments_count, :id_media, :impressions, :reach, :created_at, :updated_at
json.url insta_post_url(insta_post, format: :json)

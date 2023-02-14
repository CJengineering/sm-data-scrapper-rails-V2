class CreateInstaPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :insta_posts do |t|
      t.integer :like_count
      t.string :media_type
      t.text :media_url
      t.date :timestamp
      t.integer :comments_count
      t.integer :id_media
      t.integer :impressions
      t.integer :reach

      t.timestamps
    end
  end
end

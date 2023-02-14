class ChangeIntegerToBiginitInIdMedia < ActiveRecord::Migration[7.0]
  def change
    change_column :insta_posts, :id_media, :integer, limit: 8
  end
end

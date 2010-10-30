class AddImageRemoteUrlToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :image_remote_url, :string
  end

  def self.down
    remove_column :posts, :image_remote_url
  end
end

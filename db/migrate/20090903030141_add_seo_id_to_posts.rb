class AddSeoIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :seo_id, :string
  end

  def self.down
    remove_column :posts, :seo_id
  end
end

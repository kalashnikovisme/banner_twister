class AddBannersCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :banners_categories do |t|
      t.integer :banner_id
      t.integer :category_id
    end
  end
end

class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.text :url
      t.integer :count

      t.timestamps null: false
    end
  end
end

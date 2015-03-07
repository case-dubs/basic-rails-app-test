class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamp :created_at
      t.integer :user_id
      t.integer :category_id
      t.string :image_caption
      t.text :intro_section

      t.timestamps null: false
    end
  end
end

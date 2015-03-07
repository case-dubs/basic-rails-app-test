class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamp :created_at

      t.timestamps null: false
    end
  end
end

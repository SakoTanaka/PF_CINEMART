class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.text :staff
      t.text :cast
      t.text :releasedate
      t.text :copyright
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end

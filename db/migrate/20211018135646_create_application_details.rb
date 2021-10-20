class CreateApplicationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :application_details do |t|
      t.integer :application_id
      t.integer :movie_id

      t.timestamps
    end
  end
end

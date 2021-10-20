class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.text :purpose
      t.string :date
      t.string :media

      t.timestamps
    end
  end
end
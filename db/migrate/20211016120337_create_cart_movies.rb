class CreateCartMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_movies do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :request

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :players_min
      t.integer :duration
      t.boolean :simultaneous_start

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.datetime :start_time
      t.integer :nb_players

      t.timestamps
    end
  end
end

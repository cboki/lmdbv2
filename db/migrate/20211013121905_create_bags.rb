class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.references :game, null: false, foreign_key: true
      t.string :status
      t.string :color

      t.timestamps
    end
  end
end

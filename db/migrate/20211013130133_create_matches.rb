class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :bag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

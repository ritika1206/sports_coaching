class CreateSportBatch < ActiveRecord::Migration[7.0]
  def change
    create_table :sport_batches do |t|
      t.references :sport, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end

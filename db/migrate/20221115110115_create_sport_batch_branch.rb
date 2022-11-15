class CreateSportBatchBranch < ActiveRecord::Migration[7.0]
  def change
    create_table :sport_batch_branches do |t|
      t.references :sport_batch, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end

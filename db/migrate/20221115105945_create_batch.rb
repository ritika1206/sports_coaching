class CreateBatch < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end

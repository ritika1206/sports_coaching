class CreateBranch < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.integer :coachings_count

      t.timestamps
    end
  end
end

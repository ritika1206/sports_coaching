class CreateCoaching < ActiveRecord::Migration[7.0]
  def change
    create_table :coachings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true
      t.time :batch_from
      t.time :batch_to
      t.date :beginning
      t.date :end

      t.timestamps
    end
  end
end

class CreateCoaching < ActiveRecord::Migration[7.0]
  def change
    create_table :coachings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :beginning
      t.date :end
      t.string :status

      t.timestamps
    end
  end
end

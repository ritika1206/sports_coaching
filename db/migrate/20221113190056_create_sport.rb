class CreateSport < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :coachings_count

      t.timestamps
    end
  end
end

class CreateProfileSports < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_sports do |t|
      t.references :profile, foreign_key: true
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end

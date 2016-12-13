class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :max_age
      t.integer :min_age
      t.string :gender
      t.string :sport
      t.string :f_level

      t.timestamps
    end
  end
end

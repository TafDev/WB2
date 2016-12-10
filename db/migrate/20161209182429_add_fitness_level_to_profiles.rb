class AddFitnessLevelToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :f_level, :string
  end
end

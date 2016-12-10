class AddAgeToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :age, :integer
  end
end

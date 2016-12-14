class AddCountyToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :county, :string
  end
end

class AddCountyToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :county, :string
  end
end

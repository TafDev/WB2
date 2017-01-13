class AddIsCompleteToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :is_complete, :boolean, :default => false
  end
end

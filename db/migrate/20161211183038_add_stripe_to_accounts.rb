class AddStripeToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :stripeid, :string
    add_column :accounts, :is_premium, :boolean
  end
end

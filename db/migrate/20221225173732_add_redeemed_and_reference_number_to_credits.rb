class AddRedeemedAndReferenceNumberToCredits < ActiveRecord::Migration[7.0]
  def change
    rename_column :credits, :description, :notes
    add_column :credits, :redeemed, :boolean, null: false, default: false
    add_column :credits, :reference_number, :string
    change_column_null :credits, :method, true
    remove_column :credits, :amount, :decimal, null: false
    add_monetize :credits, :amount
  end
end

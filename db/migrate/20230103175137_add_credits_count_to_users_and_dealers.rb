class AddCreditsCountToUsersAndDealers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :credits_count, :integer, null: false, default: 0
    add_column :dealers, :credits_count, :integer, null: false, default: 0
  end
end

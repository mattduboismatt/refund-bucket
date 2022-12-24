class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :auth_token
      t.datetime :auth_token_expires_at
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end

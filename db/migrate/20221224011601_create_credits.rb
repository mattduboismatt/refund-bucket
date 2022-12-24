class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :dealer, type: :uuid, foreign_key: true
      t.decimal :amount, null: false
      t.string :method, null: false
      t.string :description
      t.date :expires_at
      t.boolean :never_expires, null: false, default: false
      t.timestamps
    end
  end
end

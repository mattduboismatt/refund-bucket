class CreateDealers < ActiveRecord::Migration[7.0]
  def change
    create_table :dealers, id: :uuid do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :slug, null: false
      t.timestamps
    end

    add_index :dealers, :name, unique: true
  end
end

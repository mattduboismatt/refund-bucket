class AddImageToDealers < ActiveRecord::Migration[7.0]
  def change
    add_column :dealers, :image, :string
  end
end

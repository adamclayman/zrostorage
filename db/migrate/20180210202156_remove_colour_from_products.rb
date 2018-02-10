class RemoveColourFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :colour, :string
  end
end

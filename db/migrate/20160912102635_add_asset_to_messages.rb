class AddAssetToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :asset, :string
  end
end

class ChangePriceFromStringToFloat < ActiveRecord::Migration[5.0]
  def change
    add_column :goomps, :price_tmp, :float
    Goomp.find_each do |goomp|
      goomp.update price_tmp: goomp.price.to_f
    end
    remove_column :goomps, :price
    rename_column :goomps, :price_tmp, :price
  end
end

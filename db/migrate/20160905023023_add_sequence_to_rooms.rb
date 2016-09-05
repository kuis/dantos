class AddSequenceToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :sequence, :integer
  end
end

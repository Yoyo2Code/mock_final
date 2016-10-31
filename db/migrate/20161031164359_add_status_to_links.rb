class AddStatusToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :read, :integer, default: 0, null: false
  end
end

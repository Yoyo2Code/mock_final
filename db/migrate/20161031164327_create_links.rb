class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url_location
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :urls do |t|
      t.string :title
      t.boolean :visible
      t.string :url
      t.integer :order

      t.belongs_to :project

      t.timestamps
    end
  end
end

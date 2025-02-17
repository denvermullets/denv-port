class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :order

      t.boolean :visible
      t.timestamps
    end
  end
end

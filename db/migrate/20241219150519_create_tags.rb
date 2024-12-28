class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :order

      t.belongs_to :project

      t.timestamps
    end
  end
end

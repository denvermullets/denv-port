class SetDefaultsForProjects < ActiveRecord::Migration[8.0]
  def change
    change_column :projects, :visible, :boolean, default: true
    change_column :projects, :order, :integer, default: 0
  end
end

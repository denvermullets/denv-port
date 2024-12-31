class AddFreelanceToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :freelance, :boolean, default: false
  end
end

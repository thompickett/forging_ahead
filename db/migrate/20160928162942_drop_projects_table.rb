class DropProjectsTable < ActiveRecord::Migration
  def up
    remove_column :attachments, :project_id
    drop_table :projects
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

class DropPasswordResetsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :password_resets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

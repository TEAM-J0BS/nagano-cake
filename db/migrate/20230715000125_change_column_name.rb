class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :is_withdrawal, :is_deleted
  end
end

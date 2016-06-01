class RenameCurrentClassinCurrentClasstoCurrent < ActiveRecord::Migration
  def change
  	rename_column :current_classes, :current_class, :current
  end
end

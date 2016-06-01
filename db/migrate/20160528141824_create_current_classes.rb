class CreateCurrentClasses < ActiveRecord::Migration
  def change
    create_table :current_classes do |t|
    	t.string :current_class
      t.timestamps null: false
    end
  end
end

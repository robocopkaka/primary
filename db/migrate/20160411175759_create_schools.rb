class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.integer :fees
      t.integer :reg_fees
      t.integer :student_size
      t.string :image

      t.timestamps null: false
    end
  end
end

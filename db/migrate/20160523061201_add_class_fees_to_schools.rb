class AddClassFeesToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :primary_one, :integer
    add_column :schools, :primary_two, :integer
    add_column :schools, :primary_three, :integer
    add_column :schools, :primary_four, :integer
    add_column :schools, :primary_five, :integer
    add_column :schools, :primary_six, :integer
    add_column :schools, :exam_fees, :integer
  end
end

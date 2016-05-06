class AddSchoolIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :school_id, :integer
  end
end

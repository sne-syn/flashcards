class ChangesToTheReviewDate < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cards, :review_date, false
  end
end

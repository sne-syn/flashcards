class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :original_text
      t.string :translated_text
      t.datetime :review_date

      t.timestamps
    end
  end
end

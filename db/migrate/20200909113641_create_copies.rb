class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.integer :book_id
      t.string :borrower
      t.date :due_date

      t.timestamps
    end
    add_foreign_key :copies, :books
  end
end

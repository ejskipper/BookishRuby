class RemoveBorrowerFromCopies < ActiveRecord::Migration[5.2]
  def change
    remove_column :copies, :borrower, :string
  end
end

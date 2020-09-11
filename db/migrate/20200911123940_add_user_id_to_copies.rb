class AddUserIdToCopies < ActiveRecord::Migration[5.2]
  def change
    add_column :copies, :user_id, :integer
  end
end

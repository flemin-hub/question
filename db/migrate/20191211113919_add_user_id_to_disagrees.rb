class AddUserIdToDisagrees < ActiveRecord::Migration[5.2]
  def change
    add_column :disagrees, :user_id, :integer
  end
end

class AddUserIdToAgrees < ActiveRecord::Migration[5.2]
  def change
    add_column :agrees, :user_id, :integer
  end
end

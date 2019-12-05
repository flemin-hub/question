class CreateDisagrees < ActiveRecord::Migration[5.2]
  def change
    create_table :disagrees do |t|
      t.integer :post_id

      t.timestamps
    end
  end
end

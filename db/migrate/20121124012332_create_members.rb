class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :image
      t.integer :turn
      t.integer :user_id
      t.timestamps
    end
  end
end

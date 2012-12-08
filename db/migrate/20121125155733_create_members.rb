class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :turn
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end

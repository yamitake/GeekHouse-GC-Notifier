class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :message
      t.integer :cron_week
      t.integer :cron_number_week
      t.integer :user_id

      t.timestamps
    end
  end
end

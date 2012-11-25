class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.datetime :cron_time
      t.integer :user_id
      t.timestamps
    end
  end
end

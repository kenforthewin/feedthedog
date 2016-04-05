class CreateFeedLogs < ActiveRecord::Migration
  def change
    create_table :feed_logs do |t|
      t.datetime :time
      t.integer :dog_id
      t.integer :user_id
      t.text :note

      t.timestamps null: false
    end
  end
end

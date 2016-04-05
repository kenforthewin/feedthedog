class AddTypeToFeedLogs < ActiveRecord::Migration
  def change
    add_column :feed_logs, :log_type, :integer, default: 0
  end
end

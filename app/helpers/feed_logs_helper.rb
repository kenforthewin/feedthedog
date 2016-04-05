# == Schema Information
#
# Table name: feed_logs
#
#  id         :integer          not null, primary key
#  time       :datetime
#  dog_id     :integer
#  user_id    :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  log_type   :integer          default(0)
#

module FeedLogsHelper
end

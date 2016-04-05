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

class FeedLog < ActiveRecord::Base
  belongs_to :dog
  belongs_to :user
  enum log_type: [:feed, :walk]
  validates :time, :dog_id, :user_id, presence: true
end

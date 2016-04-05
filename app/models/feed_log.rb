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
#

class FeedLog < ActiveRecord::Base
  belongs_to :dog
  belongs_to :user
end

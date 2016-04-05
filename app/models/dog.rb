# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dog < ActiveRecord::Base
  has_many :ownerships
  has_many :users, through: :ownerships
  has_many :feed_logs

  def logs_today
    FeedLog.where('time >= ? and dog_id = ?', DateTime.now.beginning_of_day, self.id)
  end
end

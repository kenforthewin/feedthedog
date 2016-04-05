# == Schema Information
#
# Table name: ownerships
#
#  id         :integer          not null, primary key
#  dog_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :dog

  validates_uniqueness_of :dog_id, scope: :user_id
  validates :dog_id, :user_id, presence: true
end

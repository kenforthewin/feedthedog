# == Schema Information
#
# Table name: dogs
#
#  id                   :integer          not null, primary key
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  sex                  :integer          default(0)
#

class Dog < ActiveRecord::Base
  has_many :ownerships
  has_many :users, through: :ownerships
  has_many :feed_logs
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/default_dog.png"
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_with AttachmentSizeValidator, attributes: :picture, less_than: 3.megabytes
  enum sex: [:male, :female]

  def feed_logs_today
    FeedLog.feed.where('time >= ? and dog_id = ?', DateTime.now.beginning_of_day, self.id)
  end

  def walk_logs_today
    FeedLog.walk.where('time >= ? and dog_id = ?', DateTime.now.beginning_of_day, self.id)
  end
  def logs_today
    FeedLog.where('time >= ? and dog_id = ?', DateTime.now.beginning_of_day, self.id).order(time: :desc)
  end

  def pronoun
    ["his", "her"][Dog.sexes[self.sex]]
  end
end

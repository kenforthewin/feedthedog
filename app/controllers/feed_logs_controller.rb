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

class FeedLogsController < ApplicationController
  def create
    ownership = Ownership.where(dog_id: params[:feed_log][:dog_id], user_id: current_user.id)

    unless ownership
      flash[:alert] = 'You are not an owner of this dog'
      return redirect_to root_path
    end

    @feed_log = FeedLog.new(feed_log_params)
    @feed_log.user = current_user
    @feed_log.time = DateTime.now
    @feed_log.save!

    redirect_to @feed_log.dog
  end

  private

    def feed_log_params
      params.require(:feed_log).permit(:dog_id)
    end
end

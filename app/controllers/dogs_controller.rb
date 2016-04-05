# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DogsController < ApplicationController
  before_action :set_dog_and_check_owner!, only: [:show, :edit, :update, :feed, :add_owner, :walk]

  def index
    @dogs = current_user.dogs
  end

  def new
    @dog = Dog.new
  end

  def edit
  end

  def add_owner
    user = User.find_by_email(params[:user][:email])
    user ||= User.invite!({email: params[:user][:email]}, current_user)
    user.ownerships.build(dog_id: @dog.id).save
    flash[:notice] = 'User has been sent an invitation'
    redirect_to @dog
  end

  def update
    @dog.update(dog_params)
    redirect_to @dog
  end

  def feed
    @feed_log = FeedLog.new(dog_id: @dog.id)
    @feed_log.user = current_user
    @feed_log.time = DateTime.now
    @feed_log.save!
    redirect_to @feed_log.dog
  end

  def walk
    @feed_log = FeedLog.new(dog_id: @dog.id, log_type: 'walk')
    @feed_log.user = current_user
    @feed_log.time = DateTime.now
    @feed_log.save!
    redirect_to @feed_log.dog
  end

  def create
    @dog = Dog.create(dog_params)

    @ownership = current_user.ownerships.build(dog_id: @dog.id).save

    redirect_to dogs_path
  end

  def show
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :sex, :picture)
    end

    def set_dog_and_check_owner!
      @dog = Dog.find(params[:id])

      ownership = Ownership.where(dog_id: @dog.id, user_id: current_user.id)

      unless ownership.present?
        flash[:alert] = 'You are not an owner of this pet'
        return redirect_to root_path
      end
    end

end

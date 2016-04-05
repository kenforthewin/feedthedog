class AddAttachmentPictureToDogs < ActiveRecord::Migration
  def self.up
    change_table :dogs do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :dogs, :picture
  end
end

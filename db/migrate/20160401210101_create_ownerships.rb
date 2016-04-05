class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|

      t.belongs_to :dog, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end

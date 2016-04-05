class AddSexToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :sex, :integer, default: 0
  end
end

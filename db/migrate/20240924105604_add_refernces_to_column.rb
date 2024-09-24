class AddReferncesToColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :columns, :table, foreign_key: true
  end
end

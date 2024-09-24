class AddReferncesToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :column, foreign_key: true
  end
end

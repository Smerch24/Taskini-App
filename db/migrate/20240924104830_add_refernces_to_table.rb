class AddReferncesToTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :tables, :user, foreign_key: true
  end
end

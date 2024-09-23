class AddAttributesToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :description, :text
    add_column :tasks, :status, :integer, default: 0
    add_column :tasks, :priority, :integer, default: 0
    add_column :tasks, :deadline, :datetime
  end
end

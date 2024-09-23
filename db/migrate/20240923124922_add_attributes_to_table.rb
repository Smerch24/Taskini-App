class AddAttributesToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :tables, :name, :string
  end
end

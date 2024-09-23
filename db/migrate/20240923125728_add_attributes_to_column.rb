class AddAttributesToColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :columns, :name, :string
  end
end

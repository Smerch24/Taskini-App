class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|

      t.timestamps
    end
  end
end

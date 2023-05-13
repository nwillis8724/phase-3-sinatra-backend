class CreateGame < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.integer :developer_id
      t.timestamps
    end
  end
end

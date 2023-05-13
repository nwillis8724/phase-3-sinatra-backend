class CreateDeveloper < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :developer
      t.timestamps
    end
  end
end

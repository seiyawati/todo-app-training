class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 400, null: false
      t.string :content, limit: 2000

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :user_id
      t.integer :task_id
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :tasks
  end
end

class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :content
      t.integer :order
      t.boolean :done

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end

class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :head
      t.text :body
      t.string :picture
      t.integer :number
      t.integer :parent
      t.string :formated_date
      t.references :comment
      t.references :board
      t.datetime :last_comment
      t.timestamps
    end
  end
end

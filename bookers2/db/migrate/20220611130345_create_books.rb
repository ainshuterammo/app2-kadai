class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps
    end
    # add_index :books, [:part_id, :word], unique: true
  end
end

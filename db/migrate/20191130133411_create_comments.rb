class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :work_place_id
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end

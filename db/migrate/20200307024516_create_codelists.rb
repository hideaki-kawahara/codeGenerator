class CreateCodelists < ActiveRecord::Migration[5.2]
  def change
    create_table :code_lists do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :url, null: false
      t.string :password_digest, null: false
      t.string :picture, null: false
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :code_lists, [:user_id, :created_at]
  end
end

class CreateCodelists < ActiveRecord::Migration[5.2]
  def change
    create_table :codelists do |t|
      t.text :content, null: false
      t.text :url, null: false
      t.string :password_digest, null: false
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :codelists, [:user_id, :created_at]
  end
end

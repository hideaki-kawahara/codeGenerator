class CreateExchangeLists < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_lists do |t|
      t.string :token, null: false
      t.date :use_date
      t.references :user, foreign_key: true
      t.references :code_list, foreign_key: true

      t.timestamps null: false
    end
    add_index :exchange_lists, [:user_id, :code_list_id]
  end
end

class AddTitleToCodelists < ActiveRecord::Migration[5.2]
  def up
    add_column :codelists, :title, :string
    change_column :codelists, :title, :string, :null => false
  end

  def down
    remove_column :codelists, :title
  end
end

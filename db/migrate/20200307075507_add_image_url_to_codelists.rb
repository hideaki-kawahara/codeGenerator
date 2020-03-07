class AddImageUrlToCodelists < ActiveRecord::Migration[5.2]
  def up
    add_column :codelists, :picture, :string
    change_column :codelists, :picture, :string, :null => false
  end

  def down
    remove_column :codelists, :picture
  end
end

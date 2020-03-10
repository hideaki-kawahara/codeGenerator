class RenamePasswordDigestColumnToCodelists < ActiveRecord::Migration[5.2]
  def change
    rename_column :codelists, :password_digest, :hint
  end
end

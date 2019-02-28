class ChangeDefaultOfUploadsDownload < ActiveRecord::Migration[5.2]
  def change
    change_column_default :uploads, :downloaded, false
  end
end

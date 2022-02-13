class RenameCptionColumnToPostImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_images, :cption, :caption
  end
end

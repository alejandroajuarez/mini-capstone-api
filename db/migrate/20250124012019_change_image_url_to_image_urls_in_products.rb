class ChangeImageUrlToImageUrlsInProducts < ActiveRecord::Migration[7.2]
  def change
    # rename_column :products, :image_url, :image_urls
    # change_column :products, :image_urls, :text, array: true, default: []
  end
end

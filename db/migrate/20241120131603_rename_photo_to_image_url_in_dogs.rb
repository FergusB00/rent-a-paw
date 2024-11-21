class RenamePhotoToImageUrlInDogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :dogs, :photo, :image_url
  end
end

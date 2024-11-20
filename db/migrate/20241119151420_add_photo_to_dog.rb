class AddPhotoToDog < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :photo, :string
  end
end

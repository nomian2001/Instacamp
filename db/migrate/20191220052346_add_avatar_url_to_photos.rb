class AddAvatarUrlToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :avatar_url, :string
  end
end

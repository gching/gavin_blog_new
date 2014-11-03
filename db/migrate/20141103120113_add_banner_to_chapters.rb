class AddBannerToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :banner, :string
  end
end

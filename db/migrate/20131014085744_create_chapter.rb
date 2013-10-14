class CreateChapter < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :body
    end
  end
end

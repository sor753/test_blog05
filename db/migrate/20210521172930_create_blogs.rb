class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
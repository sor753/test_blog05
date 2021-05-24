class CreateMarkMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :mark_maps do |t|
      t.references :blog, null: false, foreign_key: true
      t.references :mark, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.string :mark_name

      t.timestamps
    end
  end
end

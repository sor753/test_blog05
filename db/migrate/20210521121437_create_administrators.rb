class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :name, null: false
      t.string :hashed_password

      t.timestamps
    end
  end
end

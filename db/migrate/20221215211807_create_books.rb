class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :image_url

      t.timestamps
    end
  end
end
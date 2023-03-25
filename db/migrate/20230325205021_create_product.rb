class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :description
      t.float   :rating
      t.string  :category
      t.integer :quantity_available
      t.float   :price
      t.string  :image

      t.timestamps
    end
  end
end

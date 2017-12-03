class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :subtitle
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end

class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :title
      t.string :subtitle
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end

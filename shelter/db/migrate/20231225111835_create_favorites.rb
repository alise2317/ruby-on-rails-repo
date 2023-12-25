class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.string :img_url
      t.text :description

      t.timestamps
    end
  end
end

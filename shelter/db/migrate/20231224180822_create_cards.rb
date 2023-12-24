class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :img_url
      t.text :description

      t.timestamps
    end
  end
end

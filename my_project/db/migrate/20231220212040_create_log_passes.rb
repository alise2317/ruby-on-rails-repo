class CreateLogPasses < ActiveRecord::Migration[7.1]
  def change
    create_table :log_passes do |t|
      t.string :log
      t.string :pass

      t.timestamps
    end
    add_index :log_passes, :log, unique: true
  end
end

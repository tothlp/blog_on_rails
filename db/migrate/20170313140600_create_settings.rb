class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :key
      t.string :value
      t.string :description
      t.timestamps
    end
  end
end

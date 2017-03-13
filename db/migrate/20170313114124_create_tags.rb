class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :article
      t.timestamps
    end
  end
end

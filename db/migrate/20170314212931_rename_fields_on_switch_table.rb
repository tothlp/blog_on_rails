class RenameFieldsOnSwitchTable < ActiveRecord::Migration[5.0]
  def change
    change_table :articles_tags do |t|
      t.rename :articles_id, :article_id
      t.rename :tags_id, :tag_id
    end
  end
end

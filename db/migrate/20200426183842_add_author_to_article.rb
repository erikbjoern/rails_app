class AddAuthorToArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :author_id, :integer
    add_reference :articles, :user, foreign_key: true
  end
end
